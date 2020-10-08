class PlansController < HomeController

  skip_before_action :check_user, only: [:index]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

end
