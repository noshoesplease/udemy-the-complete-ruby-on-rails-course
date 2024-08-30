puts 1+1

puts 10/4

puts 10.to_f/4

puts "4" * 3

begin
  puts 3 * "4"
rescue TypeError
  puts "You can't multiply a number by a string"
end


puts "Hello" * 3

20.times { |i| puts i+1 }

20.times { puts rand(10)}


puts "Calculator Program"
puts "Enter a number: "
num1 = gets.chomp.to_i
puts "Enter another number: "
num2 = gets.chomp.to_i

puts "Choose an operation: "
puts "1. Add"
puts "2. Subtract"
puts "3. Multiply"
puts "4. Divide"
puts "5. Modulus"

operation = gets.chomp.to_i

case operation
  when 1
    puts num1 + num2
  when 2
    puts num1 - num2
  when 3
    puts num1 * num2
  when 4
    puts num1.to_f / num2
  when 5
    puts num1 % num2
  else
    puts "Invalid operation"
end
