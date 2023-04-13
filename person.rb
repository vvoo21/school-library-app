class Person
  def initialize(name = "Unknown", age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  attr_reader :id

  attr_accessor :name

  attr_accessor :age

  def can_use_services
    if @age >= 18 && parent_permission
      true
    end
  end

  private

  def of_age
    if @age >= 18
      true      
    else
      false
    end
  end
end
