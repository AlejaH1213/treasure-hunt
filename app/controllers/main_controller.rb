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

  #this method calculates the size of the game and then initializes the game with random numbers 
  def generate_random_game_state
    size = @game_state.length
  initialize_grid(size)
  end


  # this method is an action triggered by the user
  def randomize
    # it initializes the game, creating a grid with initial values
    initialize_game
    # then generates a random game
    @game_state = generate_random_game_state
      # indicates that the response format should be determined based on the type of request, in this case it will be javascript  
      respond_to do |format|
        format.js
      end
  end
end
