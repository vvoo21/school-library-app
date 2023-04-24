require_relative 'app'

def list_rentals
  if @rentals.empty?
    puts 'No rentals available'
    start
  end
  print 'ID of person: '
  id_person = gets.chomp.to_i
  puts 'Rentals: '
  rentals = @rentals.select { |rental| rental.person.id == id_person }
  if rentals.empty?
    puts 'No rentals available for this ID'
    start
  end
  rentals.each do |rental|
    puts "#{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
  end
  start
end
