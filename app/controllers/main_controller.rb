class MainController < ApplicationController
  before_action :initialize_game, only: [:index]


  # The index method is the responsible for setting up the initial state of the game
  def index
    render 'index'
  end

  
  def initialize_grid(size)
    # the slice happens so its possible to organize the numbers into rows 
   grid = (1..size*size).to_a.shuffle.each_slice(size).to_a
   result = []
   grid.each do |row|
    result << row.map { |number| {type: :blank, number: number}}
   end
   result
  end
  # this method is responsible for setting up the initial state of the game 
  def initialize_game
    # variable to store the current state of the game 
    @game_state ||= initialize_grid(5)
  end


  def generate_random_game_state
    size = @game_state.length
  initialize_grid(size)
  end
  # this method is responsible for generating  the intial grid for the game, first creates an array of numbers from 1 to (size*size), then shuffles the array and slices it into subarrays, each representing a row in the grid, then maps each number to a hash 



  def randomize
  initialize_game
  @game_state = generate_random_game_state
    respond_to do |format|
      format.js
    end
  end
end
