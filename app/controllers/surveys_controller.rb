# Access surveys
class SurveysController < ApplicationController
  before_action :set_survey, only: [:show,
                                    :edit,
                                    :update,
                                    :destroy]

  before_action :researcher?, except: [:subjects_home,
                                       :subjects_survey,
                                       :submit_responses]

  before_filter :subject?, only: [:subjects_home]

  # GET /surveys
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  def show
    @current_survey = Survey.find(params[:id])
    @current_project = Project.find(@current_survey.projects_id)
    @current_questions = Question.where(survey_id: @current_survey.id)
    @demo_gender = @current_survey.gender
    @demo_min_age = @current_survey.min_age
    @demo_max_age = @current_survey.max_age
    @demo_nationality = @current_survey.nationality
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @project_id = params[:id]
    @current_projects = Project.where(user_id: current_researcher.id)
  end

  # GET /surveys/1/edit
  def edit
    @current_survey = Survey.find(params[:id])
    @project_id = params[:id]
  end

  def survey_respond
    @current_survey = Survey.find(params[:id])
    @current_questions = Question.where(survey_id: @current_survey.id)
  end

  def submit_responses
    text_responses = params['text']

    SurveyResponse.add_responses_text(text_responses, 'text')
    bool_ticker = 0
    until params["bool#{bool_ticker}"].nil?

      bool_ans =  params["bool#{bool_ticker}"]
      bool_ans = bool_ans[0]
      bool_ticker += 1
      SurveyResponse.create(bool: bool_ans[0], question_id: bool_ans[1..-1])
    end
  end

  def subjects_survey
    @survey_id = params[:id]
    @current_survey = Survey.find(params[:id])
    @current_questions = Question.where(survey_id: @current_survey.id)
  end

  # POST /surveys

  def create
    @survey = Survey.new(survey_params)
    # will need more catagories for hash searches as include more questions
    if @survey.save
      redirect_to @survey, notice: 'survey was successfully created.'
    else
      render :new
    end
  end

  def subjects_home
    @surveys = Survey.all
  end

  def create_survey
    puts "****************** #{params.inspect} *****************"
    @survey = Survey.new(survey_params)
    # will need more catagories for hash searches as include more questions
    # also doesn't do order yet, how???
    puts "********************************************, #{params}"

    text_questions = params['text']
    bool_questions = params['bool_text']
    bool_choice1 = params['bool_choice1']
    bool_choice2 = params['bool_choice2']
    if @survey.save
      text_questions.each do |t|
        Question.create(text: t, kind: 0, survey_id: @survey.id)
      end

      if bool_questions.length > 1

        # Booleans!
        (1..bool_questions.length - 1).each do |i|
          Question.create(text: bool_questions[i],
                          kind: 1,
                          boolean_option_1: bool_choice1[i],
                          boolean_option_2: bool_choice2[i],
                          survey_id: @survey.id)
        end
      end

      redirect_to @survey, notice: 'Survey was successfully created.'
    else
      render :new
      puts 'fail'
    end
  end

  # PATCH/PUT /surveys/1
  def update
    if @survey.update(survey_params)
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = Survey.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def survey_params
    params.require(:survey).permit(:name, :text, :projects_id, :gender, :min_age, :max_age, :nationality)
  end

  

  # def get_signed_in
  #   @signed_in = signed_in
  # end

end
