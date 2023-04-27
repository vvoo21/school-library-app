require 'rspec'
require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  let(:book) { Book.new('The RSpec Book', 'David Chelimsky') }
  let(:person) { Person.new(19, 'Thomas') }
  let(:rental) { Rental.new('2023-04-26', book, person) }

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(book).to be_an_instance_of(Book)
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(book.title).to eq('The RSpec Book')
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(book.author).to eq('David Chelimsky')
    end
  end

  describe '#rentals' do
    it 'returns an empty array if no rentals' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'Add a rental to rentals Array' do
      book.add_rental(rental)

      expect(book.rentals.length).to eq 1
    end
  end
end
