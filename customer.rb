class Customer
  attr_reader :name

  def intialize(name)
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
      this_amount = 0
      case rental.movie.price_code
      when MOVIE::REGULAR
        this_amount += 2
        this_amount += (movie.days_rented - 2) * 1.5 if movie.days_rented > 2
      when MOVIE::NEW_RELEASE
        this_amount += element.days_rented * 3
      when MOVIE::CHILDRENS
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      #add frequent renter points
      frequent_renter_points += 1

      #add bonus for a 2 day new release movie
      if rental.movie.price_code == Movie::NEW_RELEASE && rental.days_rented > 2
        frequent_renter_points += 1
      end

      #show figures for this rental
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount

      #add footer lines
      result += "Amount owed is #{total_amount} \n"
      result += "You earned #{frequent_renter_points} frequent renter points"
      result
    end
  end
end
