dial_book = {
  'newyork' => '212',
  'newbrunswick' => '732',
  'edison' => '908',
  'plainsboro' => '609',
  'sanfrancisco' => '301',
  'miami' => '305',
  'paloalto' => '650',
  'evanston' => '847',
  'orlando' => '407',
  'lancaster' => '717'
}

# Get city names from the hash
def get_city_names(cityhash)
  cityhash.keys
end

def get_area_code(cityhash, key)
  cityhash[key]
end

loop do
  puts 'Do you want to look up an area code based on a city name? (Y/N)'
  break if gets.chomp.downcase == 'n'

  puts 'Which city do you want the area code for?'
  puts get_city_names(dial_book)
  puts 'Enter your selection'
  puts

  city = gets.chomp.downcase

  if dial_book.include?(city)
    puts "The area code for #{city} is #{get_area_code(dial_book, city)}"
  else
    puts 'City not found'
  end
end
