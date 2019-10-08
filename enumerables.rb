# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    arr = []
    my_each { |e| arr << e if yield(e) }
    arr
  end

  def my_all?(pattern = nil)
    my_each { |e| return false unless yield(e) } if block_given?
    my_each { |e| return false unless e.class == pattern } if pattern.class == Class
    my_each { |e| return false unless e =~ pattern } if pattern.class == Regexp
    my_each { |e| return false unless e } unless pattern
    true
  end

  def my_any?(pattern = nil)
    my_each { |e| return true if yield(e) } if block_given?
    my_each { |e| return true if e.class == pattern } if pattern.class == Class
    my_each { |e| return true if e =~ pattern } if pattern.class == Regexp
    my_each { |e| return true if e } unless pattern
    false
  end

  def my_none?(pattern = nil)
    my_each { |e| return false if yield(e) } if block_given?
    my_each { |e| return false if e.class == pattern } if pattern.class == Class
    my_each { |e| return false if e =~ pattern } if pattern.class == Regexp
    my_each { |e| return false if e } unless pattern
    true
  end

  def my_count(item = nil, &block)
    count = 0
    my_each { |e| count += 1 if block.call(e) } if block_given?
    return count if block_given?

    my_each { |e| count += 1 if e == item } if item
    return count if item

    my_each { count += 1 } if !item && !block_given?
    count
  end

  def my_map(&block)
    arr = []
    my_each { |e| arr << block.call(e) } if block_given?
    arr
  end

  def my_inject(initial = nil, sym = nil, &block)
    acc = initial || first
    acc = first if initial.class == Symbol
    acc = initial if !initial.class == Symbol
    acc -= acc
    my_each { |e| acc = block.call(acc, e) } if block_given?
    my_each { |e| acc = acc.send(sym, e) } if initial && sym
    my_each { |e| acc = acc.send(initial, e) } if initial.class == Symbol
    acc
  end
end

def multiply_els(array)
  array.my_inject(1) { |acc, e| acc * e }
end

puts multiply_els([2, 4, 5])
