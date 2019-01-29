# frozen_string_literal: true

module TicTacToe
  class Board
    attr_reader :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
      # ensure_board_is_valid
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

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end
  end
end
