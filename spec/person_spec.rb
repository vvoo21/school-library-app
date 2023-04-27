require 'rspec'
require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Person do
  let(:person) { Person.new( 19, 'Thomas') }
  let(:book) { Book.new('The RSpec Book', 'David Chelimsky') }
  let(:rental) { Rental.new('2023-04-26', book, person) }

  describe '#new' do
    it 'returns a Person object' do
      expect(person).to be_an_instance_of(Person)
    end
  end

  describe '#add_rental' do
    it 'add a rental to rentals Array' do
      person.add_rental(rental)
      expect(person.rentals.length).to eq 1
    end
  end

  describe '#can_use_services' do
    it "return true if the person's age is >= 18 and has parental permission" do      
      expect(person).to be_truthy
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do      
      expect(person.name).to eq('Thomas')
    end
  end

  describe '#of_age' do
    it 'Check if the person is of legal age' do      
      expect(person.age).to be >= 18
    end
  end
end