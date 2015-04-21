class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  before_action :researcher_only, :except => [:show, :survey_respond, :submit_responses]

  # GET /surveys
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  def show
    @current_survey = Survey.find(params[:id])
    @current_project = Project.find(@current_survey.projects_id)
    @current_questions = Question.where(:survey_id => @current_survey.id)
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @project_id = params[:id]
    puts "HEREHREHRHEHRHEHR #{@project_id}"
    @current_projects = Project.where(:user_id => current_researcher.id)
  end

  # GET /surveys/1/edit
  def edit
    @project_id = params[:id]
  end

  def survey_respond
    @current_survey = Survey.find(params[:id])
    @current_questions = Question.where(:survey_id => @current_survey.id)
  end

  def submit_responses
    text_responses = params['text']
    SurveyResponse.add_responses(text_responses,'text')
    #text_responses = params['bool'] you get the idea, one for each new implemented type of question
    #QUestion.add_responses(bool_responses, 'bool')
  end

  # POST /surveys

  def create
    @survey = Survey.new(survey_params)
    #will need more catagories for hash searches as include more questions
    if @survey.save
      redirect_to @survey, notice: 'survey was successfully created.'
    else
     render :new
    end
  end

  def create_survey
    puts "******************", params.inspect, "*****************"
  @survey = Survey.new(survey_params)
    #will need more catagories for hash searches as include more questions
    #also doesn't do order yet, how???
    puts "********************************************"
    puts params
    text_questions = params["text"]
    bool_questions = params["bool_text"]
    bool_choice1 = params["bool_choice1"]
    bool_choice2 = params["bool_choice2"]
    if @survey.save
      text_questions.each do |t|
        Question.create(:text =>t, :kind =>0, :survey_id => @survey.id)
      end
      if bool_questions.length > 1
        puts "DOING BOOLS SO PHUN"
        (1..bool_questions.length-1).each do |i|
        Question.create(:text=>bool_questions[i],
                        :kind => 1,
                        :boolean_option_1 => bool_choice1[i],
                        :boolean_option_2 => bool_choice2[i],
                        :survey_id => @survey.id )
        end
      end

      redirect_to @survey, notice: 'survey was successfully created.'
    else
      render :new
      puts "fail"
    end
  end

  # PATCH/PUT /surveys/1
  def update
    if @survey.update(survey_params)
      redirect_to @survey, notice: 'survey was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: 'survey was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survey_params
     params.require(:survey).permit(:name, :text, :projects_id)
    end

    def researcher_only
      unless current_subject
        redirect_to :back, :alert => "You need to be a Researcher to access this page."
      end
    end

    def get_signed_in
      @signed_in = signed_in
    end
end
