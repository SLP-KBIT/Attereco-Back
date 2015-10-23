class AttendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = Attend.includes(:schedule, :user).search(params[:q])
    @attends = @search.result.page(params[:page]).per(20)
  end
end
