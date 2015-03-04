class UserResponsesController < ApplicationController
  before_action :set_user_response, only: [:show, :edit, :update, :destroy]

  # GET /user_responses
  def index
    @surveys = Survey.all
  end

  # GET /user_responses/1
  def show
    @user_response = UserResponse.new
  end

  # GET /user_responses/new
  def new
    @user_response = UserResponse.new
  end

  # GET /user_responses/1/edit
  def edit
  end

  # POST /user_responses
  def create
    @user_response = UserResponse.new(user_response_params)

    if @user_response.save
      redirect_to @user_response, notice: 'User response was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_responses/1
  def update
    if @user_response.update(user_response_params)
      redirect_to @user_response, notice: 'User response was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_responses/1
  def destroy
    @user_response.destroy
    redirect_to user_responses_url, notice: 'User response was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_response
      @survey = Survey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_response_params
      params[:user_response]
      #params.require(:response).permit(allow) 
    end
end
