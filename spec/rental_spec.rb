require 'rspec'
require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Rental do
  let(:person) { Person.new(19, 'Thomas') }
  let(:book) { Book.new('The RSpec Book', 'David Chelimsky') }
  let(:rental) { Rental.new('2023-04-26', book, person) }

  describe '#new' do
    it 'returns a Rental object' do
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.date).to eq('2023-04-26')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds itself to the book and person rentals list' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
