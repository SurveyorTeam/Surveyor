require 'pry'
require 'byebug'

class SubjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_subject!

  # GET /subjects
  def index
    @surveys = Survey.all#change this to match surveys foreign key to response primary maybe
  end

  # GET /subjects/1
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to new_demographics_path, notice: 'Subject was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      redirect_to @subject, notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    redirect_to subjects_url, notice: 'Subject was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_params
      params[:subject]
    end
end