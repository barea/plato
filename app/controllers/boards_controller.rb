class BoardsController < HomeController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  # GET /boards
  # GET /boards.json
  def index
    @my_boards = current_user.boards
    @organization_boards = current_user.organization&.boards
  end
  # GET /boards/new
  def new
    @board = Board.new
  end

  def show

  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    @board.organization_id = current_user.organization_id
    # update subscription
    subscription = current_user.subscription || current_user.organization.subscription
    Subscription.update(subscription.id, num_of_board: subscription.num_of_board + 1)
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
