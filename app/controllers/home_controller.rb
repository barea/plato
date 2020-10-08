class HomeController < ApplicationController
  before_action :check_user

  def check_user
    redirect_to plans_path unless current_user.active?
  end
end
