require_relative 'rental'
require_relative 'app'

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength
def create_rental
  if @books.empty? || @people.empty?
    puts 'There are no books or people created yet'
    start
  end
  puts 'Select a book from the following list by number'
  @books.each_with_index do |book, index|
    puts "#{index}) Title: #{book.title}, Author: #{book.author}"
  end
  id_book = gets.chomp.to_i

  puts 'Select a person from the following list by number (not ID)'
  @people.each_with_index do |person, index|
    puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  id_person = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp
  rental = Rental.new(date, @books[id_book], @people[id_person])
  @rentals << rental
  File.write('rentals.json', JSON.pretty_generate(@rentals.map do |b|
                                                    { date: b.date, person: { name: b.person.name, age: b.person.age, id: b.person.id, type: b.person.class.name }, book: { title: b.book.title, author: b.book.author } }
                                                  end))
  puts 'Rental created successfully'
  start
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Layout/LineLength
