def arrays_and_iterators_exercise1
  puts
  puts 'arrays_and_iterators_exercise1'
  puts

  array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print array
  puts

  p array
  p array.last

  array.each do |num|
    puts num
  end
  puts
end
# arrays_and_iterators_exercise1

def arrays_and_iterators_exercise2
  puts
  puts 'arrays_and_iterators_exercise2'
  puts

  range = 1..10
  puts range
  puts

  puts range.class
  puts

  puts range.to_a
  puts
end
# arrays_and_iterators_exercise2

def arrays_and_iterators_exercise3
  puts
  puts 'arrays_and_iterators_exercise3'
  puts

  range = 1..10

  mutate_in_place = range.to_a
  puts mutate_in_place
  puts

  mutate_in_place.reverse! # bang method will change the original array
  puts mutate_in_place
  puts

  returns_new_array = range.to_a
  puts returns_new_array
  puts

  puts returns_new_array.reverse # this will not change the original array
  puts

  puts returns_new_array
  puts
end
# arrays_and_iterators_exercise3

def arrays_and_iterators_exercise4
  puts
  puts 'arrays_and_iterators_exercise4'
  puts

  range = 'a'..'z'
  puts range.to_a.shuffle
  puts range.to_a.length

  range_arr = range.to_a
  print range_arr
  puts

  ('A'..'Z').to_a.each { |letter| range_arr << letter }
  print range_arr
  puts
end
# arrays_and_iterators_exercise4

def arrays_and_iterators_exercise5
  puts
  puts 'arrays_and_iterators_exercise5'
  puts

  arr = []
  (1..10).to_a.each { |num| arr << num }
  puts 'original array'
  puts arr
  puts

  to_unshift = 'some string'
  puts 'to_unshift'
  puts to_unshift
  puts
  arr.unshift to_unshift
  puts 'unshifted array'
  puts arr
  puts

  to_append = 'some other string'
  puts 'to_append'
  puts to_append
  puts
  arr.append(to_append)
  puts 'appended array'
  puts arr
  puts

  shifted = arr.shift
  puts 'shifted array'
  puts arr
  puts
  puts 'shifted value'
  puts shifted
  puts

  popped = arr.pop
  puts 'popped array'
  puts arr
  puts
  puts 'popped value'
  puts popped
  puts
end
# arrays_and_iterators_exercise5

def arrays_and_iterators_exercise6
  puts
  puts 'arrays_and_iterators_exercise6'
  puts

  arr = []
  (1..10).to_a.each { |num| arr << num }
  puts 'original array'
  puts arr
  puts

  to_unshift = 'some string'
  puts 'to_unshift'
  puts to_unshift
  puts

  arr.unshift to_unshift
  puts 'unshifted array'
  puts arr
  puts

  puts 'unshifting again'
  puts
  arr.unshift(to_unshift)

  puts arr
  puts

  puts arr.uniq
  puts

  puts arr
  puts

  puts arr.uniq! # bang method will change the original array
  puts

  puts arr # this has been changed
  puts
end
# arrays_and_iterators_exercise6

def arrays_and_iterators_exercise7
  puts
  puts 'arrays_and_iterators_exercise7'
  puts

  arr = []
  (1..10).to_a.each { |num| arr << num }
  puts 'original array'
  puts arr
  puts

  puts 'arr.empty?'
  puts arr.empty?
  puts

  puts "arr.include?('devin')"
  puts arr.include?('devin')
  puts

  puts "arr.push('devin')"
  arr.push('devin')
  puts arr
  puts

  puts "arr.include?('devin')"
  puts arr.include?('devin')
  puts
end
# arrays_and_iterators_exercise7

def arrays_and_iterators_exercise8
  puts
  puts 'arrays_and_iterators_exercise8'
  puts

  arr = []
  (1..10).to_a.each { |num| arr << num }
  puts 'original array'
  puts arr
  puts

  arr.unshift('devin')

  puts "arr.join('-')"
  out = arr.join('-')
  puts out
  puts

  puts "arr.join('-').split('-')"
  puts out.split('-')
  puts
end
# arrays_and_iterators_exercise8

def arrays_and_iterators_exercise9
  puts
  puts 'arrays_and_iterators_exercise9'
  puts

  puts '%w{mars is the fourth planet from the sun}'
  arr = %w[mars is the fourth planet from the sun]
  print arr
  puts
end
# arrays_and_iterators_exercise9

def arrays_and_iterators_exercise10
  puts
  puts 'arrays_and_iterators_exercise10'
  puts

  arr = %w[earth is the third planet from the sun]
  print arr
  puts

  for item in arr
    print item
  end
  for item in arr
    puts item
  end

  arr.each do |item|
    print item
  end
  arr.each do |item|
    puts item
  end

  arr.each { |item| print item }
  arr.each { |item| puts item }

  arr.each { |item| print item.capitalize }
  arr.each { |item| puts item.capitalize }
end
# arrays_and_iterators_exercise10

def arrays_and_iterators_exercise11
  puts
  puts 'arrays_and_iterators_exercise11'
  puts

  arr = %w[earth is the third planet from the sun]
  print arr
  puts

  # filtering with select
  puts 'arr.select { |item| item.length > 5 }'
  puts(arr.select { |item| item.length > 5 })
  puts

  # filtering with reject
  puts 'arr.reject { |item| item.length > 5 }'
  puts(arr.reject { |item| item.length > 5 })
  puts
end
arrays_and_iterators_exercise11
