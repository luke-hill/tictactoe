# frozen_string_literal: true

module TicTacToe
  class Board
    include Helpers::Board

    attr_reader :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
      grid[y][x].value = value
    end

    def game_over
      return :winner if winner?
      return :draw if draw?

      false
    end

    private

    def winner?
      horizontal_winner? || vertical_winner? || diagonal_winner?
    end

    def horizontal_winner?
      [row_one, row_two, row_three].any? do |row|
        row.all_same? && row.none_empty?
      end
    end

    def vertical_winner?
      [column_one, column_two, column_three].any? do |column|
        column.all_same? && column.none_empty?
      end
    end

    def diagonal_winner?
      [top_left_diagonal, top_right_diagonal].any? do |diagonal|
        diagonal.all_same? && diagonal.none_empty?
      end
    end

    def draw?
      !winner? && cell_values.none_empty?
    end

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end
  end
end
