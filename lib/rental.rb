class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def charge
    amount = 0
    case @movie.price_code
    when Movie::REGULAR
      amount += 2
      amount += (@days_rented - 2) * 1.5 if @days_rented > 2
    when Movie::NEW_RELEASE
      amount += @days_rented * 3
    when Movie::CHILDREN
      amount += 1.5
      amount += (@days_rented - 3) * 1.5 if @days_rented > 3
    end
    amount
  end

  def frequent_renter_points
    (@movie.price_code == Movie::NEW_RELEASE && @days_rented > 1) ? 2 : 1
  end
end
