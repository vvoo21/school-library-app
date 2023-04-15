require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def options
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def choose_an_option(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts 'Thank you for using this app!'
    else
      puts 'Invalid choice.'
      puts ''
      start
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def start
    options
    choice = gets.chomp.to_i
    choose_an_option(choice)
  end

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

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input only the number]:'
    choice = gets.chomp.to_i
    if choice != 1 && choice != 2
      puts 'Invalid input'
      start
    end
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    if choice == 1
      create_student(name, age)
    elsif choice == 2
      create_teacher(name, age)
    end
  end

  def create_student(name, age)
    student = Student.new(nil, age, name)
    @people << student
    puts 'Student created successfully'
    start
  end

  def create_teacher(name, age)
    teacher = Teacher.new(nil, age, name)
    @people << teacher
    puts 'Teacher created successfully'
    start
  end

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

end