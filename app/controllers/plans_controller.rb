class PlansController < ApplicationController

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

end
