require 'json'
require_relative 'book'

def load_books
  @books = if File.exist?('books.json')
             JSON.parse(File.read('books.json'), symbolize_names: true).map do |book_data|
               Book.new(book_data[:title], book_data[:author])
             end
           else
             []
           end
end
