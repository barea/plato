class BoardsController < HomeController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  # GET /boards
  # GET /boards.json
  def index
    @my_boards = current_user.boards
    @orgnization_boards = current_user.organization&.boards
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  def show

  end

  def add_seat
    #   @user = OrgnaizationTenant.new(user_params)
    #   @user.organization_id = current_user.organization_id
    #   @user.save!
    #   subscription = current_user.subscription
    #   Subscription.update(subscription.id, num_of_seat: subscription.num_of_seat + 1)
  end

  def calculate
    subscription = current_user.subscription
    puts subscription.inspect
    unless subscription.plan.require_org?
      x = subscription.num_of_board * subscription.plan.monthly_board_price
      @total = x

    else
      if subscription.num_of_seat > subscription.plan.licence_seats_num
        x = subscription.num_of_seat - subscription.plan.licence_seats_num
        puts x.inspect
        y = x * subscription.plan.monthly_seat_price
      else
        y = 0
      end

      if subscription.frequancey == 'monthly'
        @total = subscription.plan.monthly_licence_price + y
      else
        @total = subscription.plan.annual_licence_price + y
      end
    end
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    @board.organization_id = current_user.organization_id
    # update subscription
    subscription = current_user.subscription
    unless subscription.plan.require_org?
      Subscription.update(subscription.id, num_of_board: subscription.num_of_board + 1)
    end

    respond_to do |format|
      if @board.save
        format.html { redirect_to root_path, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def board_params
    params.require(:board).permit(:name, :organization_id, :user_id)
  end

  def user_params
    params.require(:board).permit(:email, :name, :password, :password_confirmation)
  end
end
