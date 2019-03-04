class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :edit, :destroy]

  def index
    #Active Record
    @boards = current_user.boards

    # SQL
    # @boards = Board.all_boards(current_user.id)
  end

  def show
  end

  def new
    @board = Board.new
    # @board = current_user.boards.new
  end

  def edit
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to boards_path
    else 
      render :new
    end
    # Board.create_board(board_params, current_user.id)
    # redirect_to boards_path
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path
    end
    # Board.update_board(board_params, @board.id)
    # redirect_to boards_path
  end

  def destroy 
    @board.destroy
    redirect_to boards_path
  end

  private 
    def set_board
      @board = Board.find(params[:id])
      #@board = Board.one_board(current_user.id, params[:id])

    end

    def board_params  
      params.require(:board).permit(:name)
    end
end
