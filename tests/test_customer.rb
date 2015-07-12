require "minitest/autorun"
require_relative "../lib/customer.rb"
require_relative "../lib/movie.rb"
require_relative "../lib/rental.rb"

class CustomerTest < MiniTest::Test

  def test_single_one_day_rental_for_new_release
    result = result_string "John Doe", 3, 3, 1
    movie = Movie.new "XYZ", Movie::NEW_RELEASE
    rental = Rental.new movie, 1

    customer = create_customer "John Doe", rental

    assert_equal customer.statement, result
  end

  def test_single_one_day_rental_for_childrenz_movie
    result = result_string "John Doe", 1.5, 1.5, 1
    movie = Movie.new "XYZ", Movie::CHILDREN
    rental = Rental.new movie, 1

    customer = create_customer "John Doe", rental

    assert_equal customer.statement, result
  end

  def test_single_one_day_rental_for_regular_movie
    result = result_string "John Doe", 2, 2, 1
    movie = Movie.new "XYZ", Movie::REGULAR
    rental = Rental.new movie, 1

    customer = create_customer("John Doe", rental)

    assert_equal customer.statement, result
  end

  def test_single_three_day_rental_for_regular_movie
    result = result_string "John Doe", 3.5, 3.5, 1
    movie = Movie.new "XYZ", Movie::REGULAR
    rental = Rental.new movie, 3

    customer = create_customer("John Doe", rental)

    assert_equal result, customer.statement
  end

  def test_single_three_day_rental_for_new_release
    result = result_string "John Doe", 9, 9, 2
    movie = Movie.new "XYZ", Movie::NEW_RELEASE
    rental = Rental.new movie, 3

    customer = create_customer("John Doe", rental)

    assert_equal result, customer.statement
  end

  def test_single_four_day_rental_for_childrenz_movie
    result = result_string "John Doe", 3.0, 3.0, 1
    movie = Movie.new "XYZ", Movie::CHILDREN
    rental = Rental.new movie, 4

    customer = create_customer("John Doe", rental)

    assert_equal result, customer.statement
  end

  private

  def create_customer name, rental
    customer = Customer.new name
    customer.add_rental rental
    customer
  end

  def result_string(name, amount, total_amount, frequent_renter_points)
    result = "Rental for record #{name}\n"
    result += "XYZ" + " #{amount}\n"
    result += "Amount owed is #{total_amount}\nYou earned #{frequent_renter_points} frequent renter points"
    result
  end
end
