class DemographicsController < ApplicationController
  before_action :set_demographic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_subject!
  before_filter :made_demo?

  # GET /demographics
  def index
    @demographics = Demographic.all
  end

  # GET /demographics/1
  def show
    
  end

  # GET /demographics/new
  def new
    @demographic = Demographic.new
  end

  # GET /demographics/1/edit
  def edit
  end

  # POST /demographics
  def create
    #why demographic_params doesn't get everything is beyond me
    @demographic = Demographic.new(name: params["demographic"]["name"],gender: params["gender"],
                                  age: params["demographic"]["age"],education: params["education"],
                                  nationality: params["nationality"],set_once: params["demographic"]["set_once"],
                                  user_id: params["demographic"]["user_id"] )

    if @demographic.save
      redirect_to subjects_home_path, notice: 'Demographic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /demographics/1
  def update
    if @demographic.update(demographic_params)
      redirect_to @demographic, notice: 'Demographic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /demographics/1
  def destroy
    @demographic.destroy
    redirect_to demographics_url, notice: 'Demographic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demographic
      @demographic = Demographic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def demographic_params
      params.require(:demographic).permit(:name, :gender, :age, :education, :nationality, :user_id,:set_once)
    end
end
