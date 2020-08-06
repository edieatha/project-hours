class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def new
    @project = project.new
  end

  def index
    @projects = project.all.order(name: :asc)
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to projects_path, notice: 'project created.'
    else
      render :new, danger: 'project creation failed!'
    end
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: 'project updated.'
    else
      render :edit, danger: 'project update failed!'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'project deleted.'
  end

  private

  def set_project
    @project = project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :user_id, :icon)
  end
end
