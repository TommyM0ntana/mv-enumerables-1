# frozen_string_literal: true

require 'enumerables'

RSpec.describe Enumerable, '#my_each' do
  context 'without block' do
    let(:arr) { [1, 2] }
    it 'return Enumerator' do
      native = arr.each.class
      expect(arr.my_each.class).to eq native
    end
  end
  context 'with block' do
    let(:arr) { [1, 2] }
    it 'return Enum' do
      native = arr.each { |x| arr.include?(x) }
      expect(arr.my_each { |x| arr.include?(x) }).to eq native
    end
  end
end

RSpec.describe Enumerable, '#my_each_with_index' do
  context 'without block' do
    let(:arr) { [1, 2] }
    it 'return Enumerator' do
      native = arr.each_with_index.class
      expect(arr.my_each_with_index.class).to eq native
    end
  end
  context 'with block' do
    let(:arr) { [1, 2] }
    it 'return Enum' do
      native = arr.each_with_index { |x, _i| arr.include?(x) }
      expect(arr.my_each_with_index { |x, _i| arr.include?(x) }).to eq native
    end
  end
end

RSpec.describe Enumerable, '#my_select' do
  context 'without block' do
    let(:arr) { [1, 2] }
    it 'return Enumerator' do
      native = arr.select.class
      expect(arr.my_select.class).to eq native
    end
  end
  context 'with block' do
    let(:arr) { [1, 2] }
    it 'return Enum' do
      native = arr.select { |x| arr.include?(x) }
      expect(arr.my_select { |x| arr.include?(x) }).to eq native
    end
  end
end
RSpec.describe Enumerable, '#my_all?' do
  context 'without block' do
    let(:arr) { [1, 2] }
    it 'return Boolean' do
      native = arr.all?.class
      expect(arr.my_all?.class).to eq native
    end
  end
  context 'with block' do
    let(:arr) { [1, 2] }
    it 'return Boolean' do
      native = arr.all? { |x| arr.include?(x) }
      expect(arr.my_all? { |x| arr.include?(x) }).to eq native
    end
  end
end
RSpec.describe Enumerable, '#my_any?' do
  context 'without block' do
    let(:arr) { [1, 2] }
    it 'return Boolean' do
      native = arr.any?.class
      expect(arr.my_any?.class).to eq native
    end
  end
  context 'with block' do
    let(:arr) { [1, 2] }
    it 'return Boolean' do
      native = arr.any? { |x| arr.include?(x) }
      expect(arr.my_any? { |x| arr.include?(x) }).to eq native
    end
  end
end
RSpec.describe Enumerable, '#my_none?' do
  context 'without block' do
    let(:arr) { [1, 2] }
    it 'return Boolean' do
      native = arr.none?.class
      expect(arr.my_none?.class).to eq native
    end
  end
  context 'with block' do
    let(:arr) { [1, 2] }
    it 'return Boolean' do
      native = arr.none? { |x| arr.include?(x) }
      expect(arr.my_none? { |x| arr.include?(x) }).to eq native
    end
  end
end
RSpec.describe Enumerable, '#my_count' do
  context 'without block' do
    let(:arr) { [1, 2] }
    it 'return Integer' do
      native = arr.count.class
      expect(arr.my_count.class).to eq native
    end
  end
  context 'with block' do
    let(:arr) { [1, 2] }
    it 'return Integer' do
      native = arr.count { |x| arr.include?(x) }
      expect(arr.my_count { |x| arr.include?(x) }).to eq native
    end
  end
end
RSpec.describe Enumerable, '#my_map' do
  context 'without block' do
    let(:arr) { [1, 2] }
    it 'return Enumerator' do
      native = arr.map.class
      expect(arr.my_map.class).to eq native
    end
  end
  context 'with block' do
    let(:arr) { [1, 2] }
    it 'return Enum' do
      native = arr.map { |x| arr.include?(x) }
      expect(arr.my_map { |x| arr.include?(x) }).to eq native
    end
  end
end
RSpec.describe Enumerable, '#my_inject' do
  context 'without block' do
    let(:arr) { [1, 2] }
    it 'return Object' do
      native = arr.inject(:+)
      expect(arr.my_inject(:+)).to eq native
    end
  end
  context 'with block' do
    let(:arr) { [1, 2] }
    it 'return Object' do
      native = arr.inject { |_a, x| arr.include?(x) }
      expect(arr.my_inject { |_a, x| arr.include?(x) }).to eq native
    end
  end
end
