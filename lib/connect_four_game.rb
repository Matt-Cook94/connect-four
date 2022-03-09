# frozen_string_literal: true

require_relative 'Symbols'

class Game
  include Symbols

  attr_accessor :board, :players, :current_player_id

  def initialize(player_one_class, player_two_class)
    @board = Array.new(6) { Array.new(7, empty_circle ) }
    @players = [player_one_class.new(self, orange_circle), player_two_class.new(self, blue_circle)]
    @current_player_id = 0
    @turns = 0
    print_board
  end

  def play_game
    loop do
      play_move(current_player)
      print_board
      break if player_won?(current_player) || draw?
      switch_players
    end
  end

  def play_move(player)
    column = player.player_turn
    row = row_position(column)
    update_board(row, column, current_player)
    @turns += 1
  end

  def other_player_id
    1 - current_player_id
  end

  def switch_players
    @current_player_id = other_player_id
  end

  def current_player
    @players[current_player_id]
  end

  def print_board
    puts
    @board.each do |row|
      puts row.join(' ')
    end
    puts (1..7).to_a.join(' ')
    puts
  end

  def update_board(row, col, player)
    @board[row][col] = player.marker
  end

  def col_available?(col)
    row = 5
    until row == -1
      if @board[row][col] == empty_circle
        return true
      else
        row -= 1
      end
    end
    false
  end

  def row_position(column)
    row = 5
    until row == 0
      @board[row][column] == empty_circle ? break : row -= 1
    end
    row
  end

  def player_won?(player)
    6.times do |row|
     7.times do |column|
        if check_row?(row, column, player.marker)
          puts "Yes sir, Player #{player.marker} has won!"
          return true
        end
     end
    end
    false
  end

  def draw?
    if @turns == 42
      puts "It's a draw"
      true
    end
  end

  def check_row?(row, col, marker)
    check_horizontal?(row, col, marker) || check_vertical?(row, col, marker) || check_diagonals?(row, col, marker)
  end

  def check_horizontal?(row, col, marker)
    return if col > 3

    @board[row][col] == marker && @board[row][col + 1] == marker && @board[row][col + 2] == marker && @board[row][col + 3] == marker
  end

  def check_vertical?(row, col, marker)
    return if row > 2

    @board[row][col] == marker && @board[row + 1][col] == marker && @board[row + 2][col] == marker && @board[row + 3][col] == marker
  end

  def check_diagonals?(row, col, marker)
    return unless row < 3

    check_left_diagonal?(row, col, marker) || check_right_diagonal?(row, col, marker)
  end

  def check_left_diagonal?(row, col, marker)
    return if col > 3

    @board[row][col] == marker && @board[row + 1][col + 1] == marker && @board[row + 2][col + 2] == marker && @board[row + 3][col + 3] == marker
  end
  
  def check_right_diagonal?(row, col, marker)
    return if col < 3

    @board[row][col] == marker && @board[row + 1][col - 1] == marker && @board[row + 2][col - 2] == marker && @board[row + 3][col - 3] == marker
  end
end