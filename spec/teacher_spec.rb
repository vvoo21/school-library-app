require 'rspec'
require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(42, 'Ruby', 'Emily') }

  describe '#new' do
    it 'returns a Teacher object' do
      expect(teacher).to be_an_instance_of(Teacher)
    end
  end

  describe '#specialization' do
    it 'returns the correct specialization' do
      expect(teacher.specialization).to eq('Ruby')
    end
  end

  describe '#can_use_services' do
    it 'returns true' do
      expect(teacher.can_use_services).to be_truthy
    end
  end
end
