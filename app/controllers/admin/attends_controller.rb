class Admin::AttendsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!
  before_action :load_attend, except: [:index, :new, :create]

  def index
    @search = Attend.includes(:schedule, :user).search(params[:q])
    @attends = @search.result.page(params[:page]).per(20)
  end

  def edit
    render :show_modal_form
  end

  def update
    @attend.update(attend_params)
    render :reload
  end

  def new
    render :show_modal_form
  end

  def create
    @attend = Attend.new(attend_params)
    @attend.save
    render :reload
  end

  def destroy
    @attend.destroy
    render :reload
  end

  private

  def attend_params
    params.require(:attend).permit(
      :schedule_id, :user_id
    )
  end

  def load_attend
    return unless params[:id]
    @attend = Attend.find_by(id: params[:id])
  end
end
