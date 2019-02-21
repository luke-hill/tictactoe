# frozen_string_literal: true

require 'spec_helper'

module TicTacToe
  RSpec.describe Cell do
    describe '#initialize' do
      context 'with a valid input' do
        it { expect { subject }.not_to raise_error }
      end

      context 'with an invalid input' do
        subject { Cell.new('A') }

        it 'throws an error for invalid value' do
          expect { subject }
            .to raise_error(ArgumentError)
            .with_message("Invalid input A. Only allowed 'O' or 'X'.")
        end
      end
    end
    describe '#value' do
      subject { cell.value }

      context 'is blank by default' do
        let(:cell) { Cell.new }

        it { is_expected.to eq('') }
      end

      context 'can indicate Player 1 has played' do
        let(:cell) { Cell.new('X') }

        it { is_expected.to eq('X') }
      end

      context 'can indicate Player 2 has played' do
        let(:cell) { Cell.new('O') }

        it { is_expected.to eq('O') }
      end
    end
  end
end
