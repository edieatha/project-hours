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
      flash[:success] = 'Project created.'
      redirect_to projects_path
    else
      flash.now[:danger] = 'Project creation failed!'
      render :new
    end
  end

  def show
    @projects = Project.includes(:tasks)
  end

  def edit; end

  def update
    if @project.update(project_params)
      flash[:success] = 'Project updated.'
      redirect_to projects_path
    else
      flash.now[:danger] = 'Project update failed!'
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:success] = 'Project deleted.'
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name, :user_id, :project_icon)
  end
end
