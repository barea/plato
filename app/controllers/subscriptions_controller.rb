class SubscriptionsController < HomeController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_user, only: [:new, :create]
  before_action :user_manage_subscription, only: [:manage]

  def manage
    @subscription = current_user.subscription
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
    @plan = Plan.find(params[:plan_id])
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    if require_org?
      org = Organization.create(name: org_name)
      current_user.update!(type: 'OrgnaizationTenant', organization_id: org.id)
      @subscription.organization_id = org.id
    else
      @subscription.frequancey = 'Monthly'
    end
    @subscription.user_id = current_user.id
    @subscription.status = 'active'

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to root_path, notice: 'Subscription was successfully created.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { redirect_to plans_path, notice: 'Fail to Subscribe' }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subscription_params
    params.require(:subscription).permit(:plan_id, :status, :user_id, :num_of_board, :num_of_seat, :frequancey)
  end

  def require_org?
    params.require(:subscription).permit(:plan_require_org)[:plan_require_org] == 'true'
  end

  def org_name
    params.require(:subscription).permit(:org_name)[:org_name]
  end

  def user_manage_subscription
    raise "Operation Not Allowed" unless current_user.manage_subscription?
  end

end
