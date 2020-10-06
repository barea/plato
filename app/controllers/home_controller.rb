class HomeController < ApplicationController
  before_action :check_user

  def index
  end

  def check_user
    if current_user.subscription.present?
      redirect_to boards_path
    else
      redirect_to plans_path
    end
  end

end
