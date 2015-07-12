require "minitest/autorun"
require_relative "../lib/customer.rb"
require_relative "../lib/movie.rb"
require_relative "../lib/rental.rb"

class CustomerTest < MiniTest::Test

  def test_single_rental_for_new_release
    result = "Rental for record John Doe\n"
    result += "XYZ" + " 3\n"
    result += "Amount owed is 3\nYou earned 1 frequent renter points"
    movie = Movie.new "XYZ", Movie::NEW_RELEASE
    rental = Rental.new movie, 1

    customer = Customer.new "John Doe"
    customer.add_rental rental

    assert_equal customer.statement, result
  end
end
