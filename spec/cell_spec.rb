# frozen_string_literal: true

require 'spec_helper'

module TicTacToe
  RSpec.describe Cell do
    describe '#initialize' do
      let(:cell) { Cell.new }
      subject { cell.value }

      it { is_expected.to eq('') }

      context 'can be given to Player 1' do
        let(:cell) { Cell.new('X') }

        it { is_expected.to eq('X') }
      end

      context 'can be given to Player 2' do
        let(:cell) { Cell.new('O') }

        it { is_expected.to eq('O') }
      end

      context 'must have a valid value' do
        let(:cell) { Cell.new('A') }

        it 'throws an error for invalid value' do
          expect { subject }
            .to raise_error(ArgumentError)
            .with_message("Invalid input A. Only allowed 'O' or 'X'.")
        end
      end
    end
  end
end
