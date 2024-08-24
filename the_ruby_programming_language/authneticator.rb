choice = ''
users = [
  { username: "alice", password: "password1" },
  { username: "bob", password: "password2" },
  { username: "carol", password: "password3" },
  { username: "dave", password: "password4" },
  { username: "eve", password: "password5" },
]


attempts = 0

while choice != 'n'
  attempts += 1
  if attempts > 3
    puts "You have exceeded the number of attempts"
    exit
  end
  puts "Welcome to the authenticator"
  25.times { print "-" }
  puts

  puts "This program will take input from the user and compare password"
  print "Username: "
  username = gets.chomp

  puts
  print "Password: "
  password = gets.chomp


  user = { username: username, password: password }

  authenticated = false
  users.each do |u|
    if u[:username] == user[:username] && u[:password] == user[:password]
      authenticated = true
      break
    end
  end
  
  authenticated ? (puts user) : (puts "Credentials were not correct")

  puts "press n to quit or any other key to continue"
  choice = gets.chomp
  puts
end

puts "You have exited the authenticator"