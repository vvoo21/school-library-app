require 'rspec'
require_relative '../nameable'
require_relative '../base_decorator'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe Nameable do
  let(:nameable) { Nameable.new }


  describe '#new' do
    it 'returns a Nameable object' do
      expect(nameable).to be_an_instance_of(Nameable)
    end
  end

  describe '#correct_name' do
    it 'should raise an error' do
      expect { nameable.correct_name }.to raise_error('NotImplementedError')
    end
  end
end

describe BaseDecorator do
  let(:person) { Person.new(19, 'Thomas') }
  let(:base_decorator) { BaseDecorator.new(person) }

  describe '#new' do
    it 'returns a BaseDecorator object' do
      expect(base_decorator).to be_an_instance_of(BaseDecorator)
    end
  end

  describe '#correct_name' do
    it 'should return the correct name' do
      expect(base_decorator.correct_name).to eq('Thomas')
    end
  end
end

describe CapitalizeDecorator do
  let(:person) { Person.new(19, 'thomasThomas') }
  let(:capitalize_decorator) { CapitalizeDecorator.new(person) }

  describe '#new' do
    it 'returns a CapitalizeDecorator object' do
      expect(capitalize_decorator).to be_an_instance_of(CapitalizeDecorator)
    end
  end

  describe '#correct_name' do
    it 'should return the correct name capitalized' do
      expect(capitalize_decorator.correct_name).to eq('Thomasthomas')
    end
  end
end

describe TrimmerDecorator do
  let(:person) { Person.new(19, 'thomasthomas') }
  let(:trimmer_decorator) { TrimmerDecorator.new(person) }

  describe '#new' do
    it 'returns a CapitalizeDecorator object' do
      expect(trimmer_decorator).to be_an_instance_of(TrimmerDecorator)
    end
  end

  describe '#correct_name' do
    it 'should return the name upto 10 characters' do
      expect(trimmer_decorator.correct_name).to eq('thomasthom')
    end
  end
end
