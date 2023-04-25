require_relative 'book'
require_relative 'app'
def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  @books << book
  File.write('books.json', JSON.pretty_generate(@books.map { |b| { title: b.title, author: b.author } }))
  puts 'Book created successfully'
  puts ''
  start
end
