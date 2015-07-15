class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def statement
    total_amount = 0
    result = "Rental for record #{@name}\n"

    @rentals.each do |rental|
      #show figures for this rental
      result += rental.movie.title + " " + rental.charge.to_s + "\n"
      total_amount += rental.charge

      #add footer lines
      result += "Amount owed is #{total_amount}\n"
      result += "You earned #{rental.frequent_renter_points} frequent renter points"
    end
    result
  end
end
