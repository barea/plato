class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end




  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
    @plan = Plan.find(params[:plan_id])
  end

  # GET /subscriptions/1/edit
  def edit
  end



  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    current_user.update(type: 'OrgnaizationTenant', organization_id: Organization.create(name: org_name).id) if require_org?
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

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
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


end
