# frozen_string_literal: true

require_relative '../lib/connect_four_game'
require_relative '../lib/connect_four_player'

describe Game do
  describe '#initialize' do
    #let(:player_one) { class_double(Player, marker = 'X') }
    #let(:player_two) { class_double(Player, marker = 'O') }
    subject(:new_game) { described_class.new(Player, Player) }

    context 'when initializing a game' do
      it 'should not be nil' do
        expect(new_game).to_not be_nil
      end
      
      it 'shoulder have two instances of player class' do
        expect(new_game.players.length).to be(2)
      end

      it 'should set game board to an array of 43 (0 cell ignored for simplicity)' do
        expect(new_game.board.length).to eql(43)
      end
    end
  end

  describe '#switch_player' do
    subject(:player) { described_class.new(Player, Player) }

    context 'before the first move is made' do
      it 'should have current player as 0' do
        player_id = player.current_player_id
        expect(player_id).to eql(0)
      end
    end

    context 'after the first move is made' do
      it 'should have current player as 1' do
        player.switch_players
        player_id = player.current_player_id
        expect(player_id).to eql(1)
      end
    end

    context 'after the first two moves are made' do
      it 'should have current player return to 0' do
        player.switch_players
        player.switch_players
        player_id = player.current_player_id
        expect(player_id).to eql(0)
      end
    end
  
  end
end