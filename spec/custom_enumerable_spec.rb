# frozen_string_literal: true

require '../lib/custom_enumerable'

describe '#my_each' do
  it 'mimic #each enumerator' do
    input = [1, 2, 3, 4, 5]
    solution1 = []
    input.my_each  do |item|
      solution1 << item + 1
    end
    solution2 = []
    input.each  do |item|
      solution2 << item + 1
    end
    expect(solution1).to eql(solution2)
  end
end

describe '#my_each_with_index' do
  it 'mimic #each_with_index enumerator' do
    input = [1, 2, 3, 4, 5]
    solution1 = []
    input.my_each_with_index do |item, index|
      solution1 << item + index
    end
    solution2 = []
    input.each_with_index do |item, index|
      solution2 << item + index
    end
    expect(solution1).to eql(solution2)
  end
end

describe '#my_select' do
  it 'mimic #select enumerator' do
    input = [1, 2, 3, 4, 5, 6]
    solution1 = input.my_select { |n| n.even? }
    solution2 = input.select { |n| n.even? }
    expect(solution1).to eql(solution2)
  end
end

describe '#my_all?' do
  it 'mimic #all? enumerator, test 1' do
    input = [1, 2, 3, 4, 5, 6]
    solution1 = input.my_all? { |n| n > 0 }
    solution2 = input.all? { |n| n > 0 }
    expect(solution1).to eql(solution2)
  end
  it 'mimic #all? enumerator, test 2' do
    input = [-1, 2, 3, 4, 5, 6]
    solution1 = input.my_all? { |n| n > 0 }
    solution2 = input.all? { |n| n > 0 }
    expect(solution1).to eql(solution2)
  end
  it 'mimic #all? enumerator, test 3' do
    input = []
    solution1 = input.my_all? { |n| n > 0 }
    solution2 = input.all? { |n| n > 0 }
    expect(solution1).to eql(solution2)
  end
end

describe '#my_any?' do
  it 'mimic #any? enumerator, test 1' do
    input = [1, 2, 3, 4, 5, 6]
    solution1 = input.my_any? { |n| n > 4 }
    solution2 = input.any? { |n| n > 4 }
    expect(solution1).to eql(solution2)
  end
  it 'mimic #any? enumerator, test 2' do
    input = [1, 2, 3, 4, 5, 6]
    solution1 = input.my_any? { |n| n > 6 }
    solution2 = input.any? { |n| n > 6 }
    expect(solution1).to eql(solution2)
  end
end

describe '#my_none?' do
  it 'mimic #none? enumerator, test 1' do
    input = [1, 2, 3, 4, 5, 6]
    solution1 = input.my_none? { |n| n > 4 }
    solution2 = input.none? { |n| n > 4 }
    expect(solution1).to eql(solution2)
  end
  it 'mimic #none? enumerator, test 2' do
    input = [1, 2, 3, 4, 5, 6]
    solution1 = input.my_none? { |n| n > 6 }
    solution2 = input.none? { |n| n > 6 }
    expect(solution1).to eql(solution2)
  end
end

describe '#my_count' do
  it 'mimic #count enumerator' do
    input = [1, 2, 3, 4, 5, 6]
    solution1 = input.my_count { |n| n > 4 }
    solution2 = input.count { |n| n > 4 }
    expect(solution1).to eql(solution2)
  end
end

describe '#my_map' do
  it 'mimic #map enumerator with block' do
    input = [1, 2, 3, 4, 5, 6]
    solution1 = input.my_map { |n| n + 1 }
    solution2 = input.map { |n| n + 1 }
    expect(solution1).to eql(solution2)
  end

  it 'mimic #map enumerator with proc' do
    input = [1, 2, 3, 4, 5, 6]
    proc_sample = Proc.new { |n| n + 1 }
    solution1 = input.my_map(&proc_sample)
    solution2 = input.map(&proc_sample)
    expect(solution1).to eql(solution2)
  end
end

describe '#my_inject' do
  it 'mimic #inject enumerator' do
    input = [1, 2, 3, 4, 5, 6]
    solution1 = input.my_inject(1) { |product, num| product * num }
    solution2 = input.inject(1) { |product, num| product * num }
    expect(solution1).to eql(solution2)
  end
end
