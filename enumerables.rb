# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    arr = []
    my_each { |e| arr << e if yield(e) }
    arr
  end

  def my_all?
    my_each { |e| return false unless yield(e) }
    true
  end

  def my_any?
    my_each { |e| return true if yield(e) }
    false
  end

  def my_none?
    my_each { |e| return false if yield(e) }
    true
  end

  def my_count
    count = 0
    my_each { count += 1 }
    count
  end

  def my_map(proc)
    arr = []
    proc ? my_each { |e| arr << proc.call(e) } : my_each { |e| arr << yield(e) }
    arr
  end

  def my_inject(initial = nil)
    acc = initial || first
    my_each { |e| acc = yield(acc, e) }
    acc
  end
end

def multiply_els(array)
  array.my_inject(1) { |acc, e| acc * e }
end

puts multiply_els([2, 4, 5])
