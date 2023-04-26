require 'json'
require_relative 'book'
require_relative 'rental'
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



# def load_rentals
#   @rentals = if File.exist?('rentals.json')
#              JSON.parse(File.read('rentals.json')).map do |rental|
#                Rental.new(rental['date'], rental['book'], rental['person'])
#              end
#            else
#              []
#            end
# end
