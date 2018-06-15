# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TicTacToe::Player do
  describe '#initialize' do
    subject { TicTacToe::Player.new(details) }

    context 'with valid details' do
      let(:details) do
        {
          name: name,
          symbol: symbol
        }
      end
      let(:name) { 'Test Player' }
      let(:symbol) { 'O' }

      it 'creates the Player with a name' do
        expect(subject.name).to eq(name)
      end

      it 'creates the Player with a symbol' do
        expect(subject.symbol).to eq(symbol)
      end
    end

    context 'with invalid details' do
      let(:details) { {} }

      it 'throws an exception due to invalid details' do
        expect { subject }
          .to raise_error(ArgumentError)
          .with_message('Invalid Player. Must only have a symbol and a name.')
      end
    end
  end
end
