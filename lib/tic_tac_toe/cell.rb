# frozen_string_literal: true

module TicTacToe
  class Cell
    attr_accessor :value

    def initialize(value = '')
      @value = value
      ensure_value_is_valid
    end

    private

    def ensure_value_is_valid
      return if permitted_values.include?(value)

      raise ArgumentError, "Invalid input #{value}. Only allowed 'O' or 'X'."
    end

    def permitted_values
      ['O', 'X', '']
    end
  end
end
