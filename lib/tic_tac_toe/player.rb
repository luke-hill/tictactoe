# frozen_string_literal: true

module TicTacToe
  class Player
    attr_accessor :input

    def initialize(input)
      @input = input
      ensure_player_is_valid
    end

    def symbol
      input.fetch(:symbol)
    end

    def name
      input.fetch(:name)
    end

    private

    def ensure_player_is_valid
      return if input.keys.sort == %i[name symbol]

      raise ArgumentError, 'Invalid Player. Must only have a symbol and a name.'
    end
  end
end
