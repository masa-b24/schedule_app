class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def show
    @schedules = current_user.tasks.schedule.where(due_date: Date.today).order(start_scheduled_time: "ASC").page(params[:page]).per(4)

    #@schedules = current_user.tasks.schedule.where('due_date <= ?', Date.today).where('due_date >= ?', Date.today).page(params[:page]).per(4)
    #@schedules = current_user.tasks.schedule.page(params[:page]).per(4)
    @memos = current_user.tasks.memo.order(due_date: "ASC").page(params[:page]).per(4)
  end
end
