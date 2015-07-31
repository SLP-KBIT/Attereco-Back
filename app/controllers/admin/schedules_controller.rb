class Admin::SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!
  before_action :load_schedule, except: [:index, :new, :create]

  def index
    @search = Schedule.search(params[:q])
    @schedules = @search.result.page(params[:page]).per(20)
  end

  def edit
    render :show_modal_form
  end

  def update
    @schedule.update(schedule_params)
    render :reload
  end

  def new
    render :show_modal_form
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    render :reload
  end

  def destroy
    @schedule.destroy
    render :reload
  end

  private

  def schedule_params
    params.require(:schedule).permit(
      :caption, :start_at, :end_at, :scheduled_date, :place, :assigned_user_id
    )
  end

  def load_schedule
    return unless params[:id]
    @schedule = Schedule.find_by(id: params[:id])
  end
end
