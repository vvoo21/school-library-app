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
end