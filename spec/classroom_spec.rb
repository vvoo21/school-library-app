require 'rspec'
require_relative '../student'
require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Ruby') }
  let(:student) { Student.new( 23, classroom, 'Joe') }

  describe '#new' do
    it 'returns a Classroom object' do
      expect(classroom).to be_an_instance_of(Classroom)
    end
  end

  describe '#label' do
    it 'returns the correct label ' do
      expect(classroom.label).to eq('Ruby')
    end
  end

  describe '#students' do
    it 'returns an empty array if no students' do
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'Add a student to students Array' do
        classroom.add_student(student)  
      expect(classroom.students.length).to eq(1)
    end
  end
end