require 'json'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

def load_books
  if File.exist?('./books.json') && !File.empty?('./books.json')
    json_string = File.read('books.json')
    data = JSON.parse(json_string)
    @books = data.map do |b| 
      Book.new(b['title'], b['author'])
    end
  else
    File.write('books.json', JSON.generate([])) unless File.exist?('books.json')
    
  end
end

def load_people
  if File.exist?('./people.json') && !File.empty?('./people.json')
    json_string = File.read('people.json')
    data = JSON.parse(json_string)
    @people = data.map do |p| 
      if p['type'] == 'Student'
        Student.new(p['age'],nil, p['name'])
      elsif p['type'] == 'Teacher'
        Teacher.new(p['age'], nil, p['name'])
      end
    end
  else
    File.write('people.json', JSON.generate([])) unless File.exist?('people.json')

  end
end

def load_rentals
  if File.exist?('rentals.json') && !File.empty?('rentals.json')
    @rentals = JSON.parse(File.read('rentals.json')).map do |r|
      book = @books.find { |b| b.title == r['book']['title'] }
      person = @people.find { |p| p.name == r['person']['name'] }
      person.id = r['person']['id']
      Rental.new(r['date'], book, person)
    end
  else
    File.write('rentals.json', JSON.generate([])) unless File.exist?('rentals.json')
  end
end