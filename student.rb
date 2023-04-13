require "./person.rb"

class Student < Person
  def initialize(classroom)
    super(name = "Unknown", age, parent_permission = true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end