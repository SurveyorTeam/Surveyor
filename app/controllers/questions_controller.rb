class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    @current_question = Question.find(params[:id])
    @current_survey_responses = Survey_response.where(:question_id => @current_question.id)
    @current_survey = Survey.find(@current_question.survey_id)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/editrequire "questions_controller"
  def edit
   # @current_question = Question.find(@question.id)
    
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params[:question]
      #params.require(:project).permit(:title, :description, :user_id)
      params.require(:question).permit(:text)
    end
    
    def user_only
      unless current_user.user? 
        redirect_to :back, :alert => "You need to be a Researcher to access this page."
      end
    end
end
