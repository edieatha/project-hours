class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def new
    @project = Project.new
  end

  def index
    @projects = Project.all.order(name: :asc)
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to projects_path, notice: 'Project created.'
    else
      render :new, danger: 'Project creation failed!'
    end
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: 'project updated.'
    else
      render :edit, danger: 'Project update failed!'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project deleted!'
  end

  private

  def set_project
    @project = project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name, :user_id, :image)
  end
end
