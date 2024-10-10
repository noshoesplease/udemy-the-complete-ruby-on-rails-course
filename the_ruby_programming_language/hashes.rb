def hashes_exercise1
  puts
  puts 'hashes_exercise1'
  puts

  sample_hash = { 'a' => 1, 'b' => 2, 'c' => 3 }
  puts 'sample_hash'
  puts sample_hash
  puts
  puts 'sample_hash["b"]'
  puts sample_hash['b']
  puts

  expense = {
    'name' => 'Target',
    'description' => 'Target run to get formula',
    'id' => 1,

    'group' => 'shopping'
  }

  puts 'expense'
  puts expense
  puts

  puts 'expense["name"]'
  puts expense['name']
  puts

  puts 'expense["cost"] = 30'
  expense['cost'] = 30
  puts expense
  puts
end
# hashes_exercise1

def hashes_exercise2
  puts
  puts 'hashes_exercise2'
  puts

  puts 'hashes with symbols'
  puts

  puts 'Symbols are like constant strings whose identifier is the same as their value.'
  puts 'Symbols are more efficient than strings because they are only stored once.'
  puts

  expense = {
    name: 'Target',
    description: 'Target run to get formula',
    id: 1,
    group: 'shopping'
  }

  puts 'expense'
  puts expense
  puts

  puts 'expense[:name]'
  puts expense[:name]
  puts

  puts 'expense[:cost] = 30'
  expense[:cost] = 30
  puts expense
end
# hashes_exercise2

def hashes_exercise3
  puts
  puts 'hashes_exercise3'
  puts

  expense = {
    name: 'Target',
    description: 'Target run to get formula',
    id: 1,
    group: 'shopping'
  }

  puts 'expense.keys.each do |key|'
  expense.keys.each do |key|
    puts "key: #{key}"
    puts "value: #{expense[key]}"
    puts
  end

  puts 'expense.each do |key, value|'
  expense.each do |key, value|
    puts "key: #{key}"
    puts "value: #{value}"
    puts
  end

  puts 'expense.each do |pair|'
  expense.each do |pair|
    puts "pair: #{pair}"
    puts
  end

  puts 'expense.each_pair do |key, value|'
  expense.each_pair do |key, value|
    puts "key: #{key}"
    puts "value: #{value}"
    puts
  end

  puts 'expense.each_key do |key|'
  expense.each_key do |key|
    puts "key: #{key}"
    puts "value: #{expense[key]}"
    puts
  end

  puts 'expense.values.each do |value|'
  expense.values.each do |value|
    puts "value: #{value}"
    puts
  end
end
# hashes_exercise3

def hashes_exercise4
  # alternative ways to create hashes
  options = { font_size: 10, font_family: 'Arial' }
  puts options

  puts options[:font_size]
end
hashes_exercise4
