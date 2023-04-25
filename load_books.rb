require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'

def load_books
  @books = if File.exist?('books.json')
             JSON.parse(File.read('books.json'), symbolize_names: true).map do |book_data|
               Book.new(book_data[:title], book_data[:author])
             end
           else
             []
           end
end

def load_people
  @people = if File.exist?('people.json')
             JSON.parse(File.read('people.json'), symbolize_names: true).map do |person|
              if person['type'] == 'Student'
                Student.new(person[:age], person[:name])
              else
                Teacher.new(person[:age], person[:name])
             end
            end
           else
             []
           end
end