# frozen_string_literal: true

module Enumerable
  def my_each
    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    index = 0
    for item in self
      yield(item, index)
      index += 1
    end
  end

  def my_select
    result_array = []
    my_each do |item|
      result_array << item if yield(item)
    end
    result_array
  end

  def my_all?
    my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    result = 0
    my_each do |item|
      result += 1 if yield(item)
    end
    result
  end

  def my_map(input_proc = nil)
    result_array = []
    my_each do |item|
      if block_given?
        result_array << yield(item)
      elsif !input_proc.nil?
        result_array << input_proc.call(item)
      end
    end
    result_array
  end

  def my_inject(base)
    result = base
    my_each do |item|
      result = yield(item, result)
    end
    result
  end
end
