class TasksController < ApplicationController
  require'date'

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
    task = current_user.tasks.build(task_params)
    if task.save
      redirect_to schedules_path
    else
      render :new
    end
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to schedules_path, notice: "タスク「#{task.title}」を編集されました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to schedules_path, notice: "タスク「#{task.title}」を削除しました。"
  end

  private
    def task_params
      #due_date = Date.new(params["due_date(1i)"].to_i, params["due_date(2i)"].to_i, params["due_date(3i)"].to_i)
      #start_scheduled_time = Time.new(params["start_scheduled_time(1i)"].to_i, params["start_scheduled_time(2i"].to_i, params["start_scheduled_time(3i)"].to_i, params["start_scheduled_time(4i)"].to_i, params["start_scheduled_time(5i)"].to_i)
      #end_scheduled_time = Time.new(params["end_scheduled_time(1i)"].to_i, params["end_scheduled_time(2i"].to_i, params["end_scheduled_time(3i)"].to_i, params["end_scheduled_time(4i)"].to_i, params["end_scheduled_time(5i)"].to_i)
      params.require(:task).permit(:klass, :title, :description, %i(due_date(1i) due_date(2i) due_date(3i) start_scheduled_time(1i) start_scheduled_time(2i) start_scheduled_time(3i) start_scheduled_time(4i) start_scheduled_time(5i) end_scheduled_time(1i) end_scheduled_time(2i) end_scheduled_time(3i) end_scheduled_time(4i) end_scheduled_time(5i)))
      #.merge(due_date: due_date, start_scheduled_time: start_scheduled_time, end_scheduled_time: end_scheduled_time) 
    end
     
end
