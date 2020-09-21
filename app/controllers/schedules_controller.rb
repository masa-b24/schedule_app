class SchedulesController < ApplicationController
  def show
    @schedules = current_user.tasks.schedule
    @memos = current_user.tasks.memo
  end
end
