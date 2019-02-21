# frozen_string_literal: true

require 'spec_helper'

module TicTacToe
  RSpec.describe Board do
    let(:fake_cell) { Struct.new(:value) }
    let(:_) { fake_cell.new }
    let(:o) { fake_cell.new("O") }
    let(:x) { fake_cell.new("X") }

    let(:blank_board) do
      [
        [_, _, _],
        [_, _, _],
        [_, _, _]
      ]
    end

    let(:active_board) do
      [
        [_, _, _],
        [x, _, o],
        [_, o, _]
      ]
    end

    subject { Board.new(grid: active_board) }

    describe '#initialize' do
      it 'creates a 3x3 grid' do
        expect(subject.grid.length).to eq(3)

        subject.grid.each do |row|
          expect(row.length).to eq(3)
        end
      end
    end

    describe '#cell' do
      it 'returns the cell based on the co-ordinates' do
        expect(subject.cell(2, 1)).to be_a_kind_of(fake_cell)
      end
    end

    describe '#set_cell' do
      it 'updates the cell value based on the co-ordinates' do
        subject.set_cell(0, 0, "O")

        expect(subject.cell(0, 0).value).to eq("O")
      end
    end

    describe '#game_over' do
      let(:board_instance) { Board.new(grid: active_board) }
      subject { board_instance.game_over }

      before do
        allow(board_instance).to receive(:winner?).and_return(winner?)
        allow(board_instance).to receive(:draw?).and_return(draw?)
      end

      context 'with a winning player' do
        let(:winner?) { true }
        let(:draw?) { false }

        it { is_expected.to eq(:winner) }
      end

      context 'when the game is drawn' do
        let(:winner?) { false }
        let(:draw?) { true }

        it { is_expected.to eq(:draw) }
      end

      context 'when the game is ongoing' do
        let(:winner?) { false }
        let(:draw?) { false }

        it { is_expected.to be false }
      end
    end
  end
end
