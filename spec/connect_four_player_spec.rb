# frozen_string_literal: true

require_relative '../lib/connect_four_player'

describe Player do
  describe '#initialize' do
    subject(:player) { described_class.new(self, "X") }

    context 'when a player is initialized' do
      it 'should give player marker value' do
        marker = player.marker
        expect(marker).to eql('X')
      end
    end
  end

  describe '#verify_input' do
    subject(:move_check) { described_class.new(self, 'X') }

    context 'when a player makes a valid move' do
      it 'should receive move position' do
        user_input = '5'
        verified_input = move_check.verify_input(user_input)
        expect(verified_input).to eql('5')
      end
    end

    context 'when move position is not valid' do
      context 'when move position is already taken' do
        xit 'should not receive move position' do
          user_input = '1'
          verified_input = move_check.verify_input(user_input)
          expect(verified_input).to be_nil
        end  
      end

      context 'when move entered is out of bounds' do
        it 'should not receive move position' do
          user_input = '8'
          verified_input = move_check.verify_input(user_input)
          expect(verified_input).to be_nil
        end  
      end

      context 'when move entered is not a number' do
        it 'should not receive move position' do
          user_input = '/'
          verified_input = move_check.verify_input(user_input)
          expect(verified_input).to be_nil
        end  
      end
    end
  end




end