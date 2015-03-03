class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /studies
  def index
    @studies = Study.all
  end

  # GET /studies/1
  def show
  end

  # GET /studies/new
  def new
    @study = Study.new
  end

  # GET /studies/1/edit
  def edit
  end

  # POST /studies
  def create
    @study = Study.new(study_params)

    if @study.save
      redirect_to @study, notice: 'Study was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /studies/1
  def update
    if @study.update(study_params)
      redirect_to @study, notice: 'Study was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /studies/1
  def destroy
    @study.destroy
    redirect_to studies_url, notice: 'Study was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def study_params
      params.require(:study).permit(:title, :description)
    end
end
