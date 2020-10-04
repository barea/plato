class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def index
  end

  def check_user
    redirect_to plans_path unless current_user.tenant.present?
  end

end
