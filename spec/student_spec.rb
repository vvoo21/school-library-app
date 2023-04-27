require 'rspec'
require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:classroom) { Classroom.new('virtual classroom') }
  let(:student) { Student.new(23, classroom, 'Joe') }

  describe '#new' do
    it 'returns a Student object' do
      expect(student).to be_an_instance_of(Student)
    end
  end

  describe '#play_hooky' do
    it 'return a string ¯¯\\(ツ)/¯' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#classroom=(classroom)' do
    it 'assign student to a classroom' do
      expect(student.classroom).to eq(classroom)
    end
  end
end
