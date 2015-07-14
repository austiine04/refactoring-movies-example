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
      this_amount = rental.charge

      #show figures for this rental
      result += rental.movie.title + " " + this_amount.to_s + "\n"
      total_amount += this_amount

      #add footer lines
      result += "Amount owed is #{total_amount}\n"
      result += "You earned #{rental.frequent_renter_points} frequent renter points"
    end
    result
  end
end
