require './person'

class Teacher < Person
  def initialize( age,specialization, name = 'Unknown', parent_permission = 1)
    super( age,name, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
