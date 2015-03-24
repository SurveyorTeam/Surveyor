class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :user_only

  # GET /projects
  def index
    @projects = Project.where(:user_id => current_user.id)
  end

  # GET /projects/1
  def show
    @current_project = Project.find(params[:id])
    @current_surveys = Survey.where(:projects_id => @current_project.id)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def user_only
      unless current_user.user?
        redirect_to :back, :alert => "You need to be a Researcher to access this page."
      end
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params[:project]
    end
end
