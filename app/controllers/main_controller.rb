class MainController < ApplicationController
  before_action :initialize_game, only: [:index, :reveal]
  # The index method is the responsible for setting up the initial state of the game
  def index
    render 'index'
  end
  # this method is responsible for setting up the initial state of the game 
  def initialize_game
    # variable to store the current state of the game 
    @game_state = initialize_grid(5)
  end
  # this method is responsible for generating  the intial grid for the game 
  def initialize_grid(size)
    Array.new(size) {Array.new(size,{ type: :blank, revealed: false})}
  end
  # this method handles the user click in one of the grids
  def reveal
    row = params[:row].to_i
    col = params[:col].to_i

    render json: {status: 'success', game_state: @game_state}
  end
end
