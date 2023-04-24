require './person'

def list_people
    if @people.empty?
      puts 'The list is empty'
      puts ''
      start
    end
    @people.each do |person|
      puts "[#{person.class.name}]  Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    puts ''
    start
  end