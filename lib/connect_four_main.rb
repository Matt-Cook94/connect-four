# frozen_string_literal: true

require_relative '../lib/connect_four_game'
require_relative '../lib/connect_four_player'

game = Game.new(Player, Player)
game.play_game