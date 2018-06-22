# frozen_string_literal: true

class Array
  def all_empty?
    self.all? { |element| element.to_s.empty? }
  end

  def all_same?
    self.uniq.length <= 1
  end

  def any_empty?
    self.any? { |element| element.to_s.empty? }
  end

  def none_empty?
    !any_empty?
  end
end
