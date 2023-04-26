require_relative 'app'

module CreatePerson
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
      create_student(age, name)
    elsif choice == 2
      create_teacher(age, name)
    end
  end

  def create_student(age, name)
    student = Student.new(nil, age, name)
    @people << student
    File.write('people.json', JSON.pretty_generate(@people.map { |b| { name: b.name, age: b.age, id: b.id } }))
    puts 'Student created successfully'
    start
  end

  def create_teacher(age, name)
    teacher = Teacher.new(nil, age, name)
    @people << teacher
    File.write('people.json', JSON.pretty_generate(@people.map { |b| { name: b.name, age: b.age, id: b.id } }))
    puts 'Teacher created successfully'
    start
  end

end
