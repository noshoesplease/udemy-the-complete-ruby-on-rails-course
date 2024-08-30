def render_title
  puts "Simple Calculator"
  20.times { print "-" }
  puts
end

def get_inputs
  puts "Enter a number: "
  num1 = gets.chomp.to_i
  puts "Enter another number: "
  num2 = gets.chomp.to_i

  [num1, num2]
end

def render_operations_menu
  puts "Choose an operation: "
  puts "1. Add"
  puts "2. Subtract"
  puts "3. Multiply"
  puts "4. Divide"
  puts "5. Modulus"
end

def get_operation
  gets.chomp.to_i
end

def add(num1, num2)
  num1 + num2
end

def sub(num1, num2)
  num1 - num2
end

def mult(num1, num2)
  num1 * num2
end

def div(num1, num2)
  num1.to_f / num2
end

def mod(num1, num2)
  if num2 == 0
    return num1.to_f / num2
  end
  num1 % num2
end

def dispatch_operation(operation, num1, num2)
  case operation
    when 1
      puts "The first number added to the second number is: #{add(num1, num2)}"
    when 2
      puts "The first number subtracted from the second number is: #{sub(num1, num2)}"
    when 3
      puts "The first number multiplied by the second number is: #{mult(num1, num2)}"
    when 4
      puts "The first number divided by the second number is: #{div(num1, num2)}"
    when 5
      puts "The first number modulo the second number is: #{mod(num1, num2)}"
    else
      puts "Invalid operation"
  end
end

def render_calculate(operation, num1, num2)
  begin
    dispatch_operation(operation, num1, num2)
  rescue ZeroDivisionError
    puts "You can't divide by zero"
  end
end

render_title

num1, num2 = get_inputs

render_operations_menu

operation = get_operation

render_calculate(operation, num1, num2)