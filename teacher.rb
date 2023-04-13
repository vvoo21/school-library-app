require "./person.rb"

class Teacher < Person
  def initialize(specialization)
    super(name = "Unknown", age, parent_permission = true)
    @specialization = specialization   
  end

  def can_use_services
    true
  end
end