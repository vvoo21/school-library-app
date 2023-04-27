require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission = 1)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission == 1
    @rentals = []
  end

  def add_rental(rental)
    return if @rentals.include?(rental)

    @rentals << rental
    rental.person = self
    rental.book.rentals << rental
  end

  def can_use_services
    return unless @age >= 18 && parent_permission

    true
  end

  def correct_name
    @name
  end

  # Private methods
  private

  def of_age
    @age >= 18
  end
end
