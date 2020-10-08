class InvitationsController < HomeController
  before_action :set_invitation, only: [:destroy]
  skip_before_action :check_user, only: [:redeem]

  # GET /invitations
  # GET /invitations.json
  def index
    @invitations = Invitation.where(organization_id: current_user.organization_id).all
  end

  def redeem
    inv = Invitation.validate_code(invitation_code[:code])
    if inv && current_user.individual?
      ActiveRecord::Base.transaction do
        inv.update!(used_by_user_id: current_user.id)
        current_user.update!(type: 'OrgnaizationTenant', organization_id: inv.organization_id)
        sub = Subscription.where(organization_id: inv.organization_id).last
        sub.update!(num_of_seat: sub.num_of_seat+1)
      end
      redirect_to boards_path, notice: 'Welcome.'
    else
      redirect_to plans_path, notice: 'Invalid Code.'
    end
  end

  def generate
    invitation_params = {invited_by_user_id: current_user.id, organization_id: current_user.organization_id}
    @invitation = Invitation.new(invitation_params)

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to invitations_path, notice: 'Invitation was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to invitations_url, notice: 'Invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invitation_code
    params.require(:invitation).permit(:code)
  end
end
