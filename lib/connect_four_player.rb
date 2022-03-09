# frozen_string_literal: true

class Player
  attr_accessor :name, :marker

  def initialize(game, marker)
    @game = game
    @marker = marker
  end

  def player_turn
    loop do
      move = verify_input(player_input).to_i - 1
      return move if move && @game.col_available?(move)
      puts 'Input Error!'
    end
  end

  def verify_input(number)
    return number if number.match(/^[0-7]$/)
  end

  def player_input
    puts "Player #{marker}: Choose a column on the board to move"
    gets.chomp
  end

end
