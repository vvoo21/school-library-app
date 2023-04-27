class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    return if @rentals.include?(rental)

    @rentals << rental
    rental.book = self
    rental.person.rentals << rental
  end
end
