# # frozen_string_literal: true

require_relative 'play'

puts <<~HEREDOC

  Welcome to Tic-Tac-Toe!

  This is a 2 player game.

  The goal of is to get 3 in a row.

  (Click ENTER to start!)

HEREDOC

gets
game = Play.new
game.lets_play
