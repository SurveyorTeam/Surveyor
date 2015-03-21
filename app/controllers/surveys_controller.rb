class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :signed_in 
  # if !:get_signed_in
  #   before_action :authenticate_user
  #   before_action :authenticate_subject
  # end


  # GET /surveys
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  def show
    @current_survey = Survey.find(params[:id])
    @current_questions = Question.where(:survey_id => @current_survey.id)
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @current_projects = Project.where(:user_id => current_user.id)
  end

  # GET /surveys/1/edit
  def edit
  end
  def survey_respond
    @current_survey = Survey.find(params[:id])
    @current_questions = Question.where(:survey_id => @current_survey.id)
  end
  def submit_responses
    text_responses = params['text']
    Survey_response.add_responses(text_responses,'text')
    #text_responses = params['bool'] you get the idea, one for each new implemented type of question
    #QUestion.add_responses(bool_responses, 'bool')
  end
  # POST /surveys
  def create
    #@current_study = #{current_study} -- need to pass current study in, possibly when linking from creating a study
    #doesn't properly do studies either yet
    #fix later
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to @survey, notice: 'survey was successfully created.'
    else
      render :new
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
      params.require(:survey).permit(:title, :question)
    end

    def get_signed_in
      @signed_in = signed_in 
    end
end