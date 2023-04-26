require './book'
require './student'
require './teacher'
require './rental'
require './list_books'
require './list_people'
require './create_person'
require './create_book'
require './create_rental'
require './list_rentals'
require './load_data'

class App
  include CreatePerson

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
    load_books
    load_people
    load_rentals
    options
    choice = gets.chomp.to_i
    choose_an_option(choice)
  end

end
