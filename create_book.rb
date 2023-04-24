require_relative 'book'
require_relative 'app'
def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  @books << book
  puts 'Book created successfully'
  puts ''
  start
end
