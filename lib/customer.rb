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
    total_amount, frequent_renter_points = 0, 0
    result = "Rental for record #{@name}\n"

    @rentals.each do |rental|
      this_amount = amount_for rental

      #add frequent renter points
      frequent_renter_points += 1

      #add bonus for a 2 day new release movie
      if rental.movie.price_code == Movie::NEW_RELEASE && rental.days_rented > 2
        frequent_renter_points += 1
      end

      #show figures for this rental
      result += rental.movie.title + " " + this_amount.to_s + "\n"
      total_amount += this_amount

      #add footer lines
      result += "Amount owed is #{total_amount}\n"
      result += "You earned #{frequent_renter_points} frequent renter points"
    end
    result
  end

  private
  def amount_for(rental)
    amount = 0
    case rental.movie.price_code
    when Movie::REGULAR
      amount += 2
      amount += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
    when Movie::NEW_RELEASE
      amount += rental.days_rented * 3
    when Movie::CHILDREN
      amount += 1.5
      amount += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
    end
    amount
  end
end
