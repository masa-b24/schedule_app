class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def show
    @schedules = current_user.tasks.schedule.where(due_date: Date.current).order(:start_scheduled_time).page(params[:page]).per(4)
    @memos = current_user.tasks.memo.order(:due_date).page(params[:page]).per(4)
  end
end
