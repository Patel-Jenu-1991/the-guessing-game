#!/usr/bin/env bash
# File: guessinggame.sh

# get number of files
function file_count {
  local files=$(ls ./ | wc -w | egrep -o "[0-9]+")
  echo $files
}

# prints decorative text with the given argument in between the dashes
function decorative_text {
  echo
  echo "-------------------------------------- $@ --------------------------------------"
  echo
}

# the game loop
function game_loop {
  local files=$(file_count)
  decorative_text 'The Guessing Game'
  while [[ true ]]; do
    # Prompt the user for the number of files in the current directory
    echo
    read -p ' >> Enter the number of files in the current directory: ' guess
    echo
    if [[ $guess =~ (^[1-9][0-9]*$) ]] || [[ $guess =~ (^[0]$) ]] && [[ ! $guess =~ (-[0-9]) ]]; then
      # the user input is valid continue with game play
      if [[ $guess -lt $files ]]; then
        echo '  > Your guess is too low!'
      elif [[ $guess -gt $files ]]; then
        echo '  > Your guess is too high!'
      else
        echo
        echo ' *******  Congratulations! You guessed the correct number of files: ' $guess ' *******'
        echo
        # print a decorative thank you message
        decorative_text 'Thank You for Playing!'
        exit 0
      fi
    else
      # Notify the user about bad input
      echo '  /!\   Not a valid integer! Please try again.'
    fi
  done
}

game_loop
