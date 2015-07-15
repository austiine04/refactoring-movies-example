class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDREN = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end

  def charge days_rented
    amount = 0
    case @price_code
    when Movie::REGULAR
      amount += 2
      amount += (days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      amount += days_rented * 3
    when Movie::CHILDREN
      amount += 1.5
      amount += (days_rented - 3) * 1.5 if days_rented > 3
    end
    amount
  end

  def frequent_renter_points days_rented
    (@price_code == Movie::NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end
