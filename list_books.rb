require './book'

def list_books
  if @books.empty?
    puts 'The list is empty'
    puts ''
    start
  end
  @books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
  puts ''
  start
end
