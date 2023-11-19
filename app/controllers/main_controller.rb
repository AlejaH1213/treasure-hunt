class MainController < ApplicationController
    # The index method is the responsible for setting up the initial state of the game
    def index
        # These are the clues for the game 
        @clues = [
            "look in the table",
            "open the drawer",
            "read the notebook"
        ]
        # This variable is keeping track of the index of the current clue
        @current_clue_index = 0
        #this variable holds the content of the current clue, its initialized with the first clue of the array
        @current_clue = @clues[@current_clue_index]
    end
end
