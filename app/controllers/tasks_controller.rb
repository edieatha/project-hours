class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def new
    @task = Task.new
  end

  def index
    @tasks = current_user.tasks
  end

  def index_tasks_no_project
    @tasks_no_project = current_user.tasks.includes(:project_tasks).where(project_tasks: { project_id: nil })
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.projects = Project.find(params[:task][:project_ids]) if params[:task][:project_ids]

    if @task.save
      if params[:task][:project_ids]
        flash[:success] = 'Created task with project.'
        redirect_to tasks_path
      else
        flash[:success] = 'Created task without project.'
        redirect_to tasks_no_project_path
      end
    else
      flash.now[:danger] = 'Task creation failed'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @task.projects = []
    @task.projects =Project Project.find(params[:task][:project_ids]) if params[:task][:project_ids]

    if @task.update(task_params)
      if params[:task][:project_ids]
        redirect_to tasks_path
        flash[:success] = 'Task updated!'
      else
        flash[:success] = 'Task updated!'
        redirect_to tasks_no_project_path
      end
    else
      flash[:danger] = 'Task update failed!'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'Task deleted!'
    redirect_to tasks_path
  end

  # def search
  #   @parameter = params[:search]
  #   @results = task.where('name LIKE ?', "%#{@parameter}%")
  # end

  private

  def set_task
    @task = task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :task_hours, :user_id, :project_id)
  end
end
