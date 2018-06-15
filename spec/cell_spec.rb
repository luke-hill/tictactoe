# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TicTacToe::Cell do
  describe '#initialize' do
    let(:cell) { TicTacToe::Cell.new }
    subject { cell.value }

    it { is_expected.to eq('') }

    context 'can be given to Player 1' do
      let(:cell) { TicTacToe::Cell.new('X') }

      it { is_expected.to eq('X') }
    end

    context 'can be given to Player 2' do
      let(:cell) { TicTacToe::Cell.new('O') }

      it { is_expected.to eq('O') }
    end
  end
end
