# frozen_string_literal: true

require 'spec_helper'

module TicTacToe
  RSpec.describe Player do
    let(:details) do
      {
        name: name,
        symbol: symbol
      }
    end
    let(:name) { 'Test Player' }
    let(:symbol) { 'O' }

    subject { Player.new(details) }

    describe '#initialize' do
      context 'with valid details' do
        it 'creates the player' do
          expect { subject }.not_to raise_error
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

    describe '#name' do
      it 'shows the Player name' do
        expect(subject.name).to eq(name)
      end
    end

    describe '#symbol' do
      it "shows the Players' symbol" do
        expect(subject.symbol).to eq(symbol)
      end
    end
  end
end
