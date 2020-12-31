class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i(show edit update destroy)

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to schedules_path, notice: "タスク「#{@task.title}」を作成されました。"
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to schedules_path, notice: "タスク「#{@task.title}」を編集されました。"
    else
      render :edit
    end
  end

  def destroy
    task.destroy
    redirect_to schedules_path, notice: "タスク「#{task.title}」を削除しました。"
  end

  private
    def task_params
      params.require(:task).permit(:klass, :title, :description, %i(due_date(1i) due_date(2i) due_date(3i) start_scheduled_time(1i) start_scheduled_time(2i) start_scheduled_time(3i) start_scheduled_time(4i) start_scheduled_time(5i) end_scheduled_time(1i) end_scheduled_time(2i) end_scheduled_time(3i) end_scheduled_time(4i) end_scheduled_time(5i)))
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
