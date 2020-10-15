class TasksController < ApplicationController
  before_action :authenticate_user!

  require'date'

  def index
    @tasks = current_user.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to schedules_path, notice: "タスク「#{@task.title}」を編集されました。"
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to schedules_path, notice: "タスク「#{task.title}」を削除しました。"
  end

  private
    def task_params
      params.require(:task).permit(:klass, :title, :description, %i(due_date(1i) due_date(2i) due_date(3i) start_scheduled_time(1i) start_scheduled_time(2i) start_scheduled_time(3i) start_scheduled_time(4i) start_scheduled_time(5i) end_scheduled_time(1i) end_scheduled_time(2i) end_scheduled_time(3i) end_scheduled_time(4i) end_scheduled_time(5i)))
      #params.require(:task).permit(:klass, :title, :description, %i(due_date(1i) due_date(2i) due_date(3i) start_scheduled_time(4i) start_scheduled_time(5i) end_scheduled_time(4i) end_scheduled_time(5i))).merge("start_scheduled_time(1i)" => params['due_date(1i)'], "start_scheduled_time(2i)" => params['due_date(2i)'], "start_scheduled_time(3i)" => params['due_date(3i)'], "end_scheduled_time(1i)" => params['due_date(1i)'], "end_scheduled_time(2i)" => params['due_date(2i)'], "end_scheduled_time(3i)" => params['due_date(3i)'])
    end
     
end
