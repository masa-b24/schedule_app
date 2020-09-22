class SchedulesController < ApplicationController
  def show
    @schedules = current_user.tasks.schedule.page(params[:page]).per(3)
    @memos = current_user.tasks.memo.page(params[:page]).per(3)
  end
end
