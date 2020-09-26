class TasksController < ApplicationController
  require'date'

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to schedules_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to scheduled_path, notice: "タスク「#{schedule.title}」を削除しました。"
  end

  private
    def task_params
      due_date = Date.new(params["due_date(1i)"].to_i, params["due_date(2i)"].to_i, params["due_date(3i)"].to_i)
      start_scheduled_time = Time.new(params["start_scheduled_time(1i)"].to_i, params["start_scheduled_time(2i"].to_i, params["start_scheduled_time(3i)"].to_i, params["start_scheduled_time(4i)"].to_i, params["start_scheduled_time(5i)"].to_i)
      end_scheduled_time = Time.new(params["end_scheduled_time(1i)"].to_i, params["end_scheduled_time(2i"].to_i, params["end_scheduled_time(3i)"].to_i, params["end_scheduled_time(4i)"].to_i, params["end_scheduled_time(5i)"].to_i)
      params.require(:task).permit(:klass, :title, :description).merge(due_date: due_date, start_scheduled_time: start_scheduled_time, end_scheduled_time: end_scheduled_time) 
    end
     
end
