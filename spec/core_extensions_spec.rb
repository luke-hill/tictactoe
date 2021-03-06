# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Array do
  let(:blank_array) { [] }
  let(:single_item_array) { ['a'] }
  let(:nil_items_array) { [nil, nil, '', ''] }
  let(:large_empty_array) { ['', '', '', '', ''] }
  let(:large_nonempty_array) { ['', 'a', 3, Object.new, ''] }

  describe '#all_empty?' do
    it 'is true if all elements of an array are empty' do
      expect(large_empty_array.all_empty?).to be true
    end

    it 'is false if all elements of an array are not empty' do
      expect(large_nonempty_array.all_empty?).to be false
    end

    it 'is true for a blank array' do
      expect(blank_array.all_empty?).to be true
    end

    it 'is false for a single element in an array' do
      expect(single_item_array.all_empty?).to be false
    end

    it 'is true if all elements of an array are nil or empty' do
      expect(nil_items_array.all_empty?).to be true
    end
  end

  describe '#all_same?' do
    it 'is true if all elements of an array are identical' do
      expect(large_empty_array.all_same?).to be true
    end

    it 'is false if all elements of an array are not identical' do
      expect(large_nonempty_array.all_same?).to be false
    end

    it 'is true for a blank array' do
      expect(blank_array.all_same?).to be true
    end

    it 'is true for a single element in an array' do
      expect(single_item_array.all_same?).to be true
    end

    it 'is false if an array contains nil and empty strings' do
      expect(nil_items_array.all_same?).to be false
    end
  end

  describe '#any_empty?' do
    it 'is true if all elements of an array are empty' do
      expect(large_empty_array.any_empty?).to be true
    end

    it 'is true if some elements of an array are empty' do
      expect(large_nonempty_array.any_empty?).to be true
    end

    it 'is false for a blank array' do
      expect(blank_array.any_empty?).to be false
    end

    it 'is false for a single non-empty element in an array' do
      expect(single_item_array.any_empty?).to be false
    end

    it 'is true if all elements of an array are empty or nil' do
      expect(nil_items_array.any_empty?).to be true
    end
  end

  describe '#none_empty?' do
    it 'is false if all elements of an array are empty' do
      expect(large_empty_array.none_empty?).to be false
    end

    it 'is false if some elements of an array are empty' do
      expect(large_nonempty_array.none_empty?).to be false
    end

    it 'is true for a blank array' do
      expect(blank_array.none_empty?).to be true
    end

    it 'is true for a single non-empty element in an array' do
      expect(single_item_array.none_empty?).to be true
    end

    it 'is false if all elements of an array are empty or nil' do
      expect(nil_items_array.none_empty?).to be false
    end
  end
end
