# frozen_string_literal: true

module TicTacToe
  module Helpers
    module Board
      private

      def row_one
        cell_values[0..2]
      end

      def row_two
        cell_values[3..5]
      end

      def row_three
        cell_values[6..8]
      end

      def column_one
        [
          cell_values[0],
          cell_values[3],
          cell_values[6]
        ]
      end

      def column_two
        [
          cell_values[1],
          cell_values[4],
          cell_values[7]
        ]
      end

      def column_three
        [
          cell_values[2],
          cell_values[5],
          cell_values[8]
        ]
      end

      def top_left_diagonal
        [
          cell_values[2],
          cell_values[4],
          cell_values[6]
        ]
      end

      def top_right_diagonal
        [
          cell_values[0],
          cell_values[5],
          cell_values[8]
        ]
      end

      def cell_values
        grid.flatten.map(&:value)
      end
    end
  end
end
