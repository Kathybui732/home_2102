require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test
  def test_it_exists
    jessie = Renter.new("Jessie")
    assert_instance_of Renter, jessie
  end

  def test_it_has_a_name
    jessie = Renter.new("Jessie")
    assert_equal "Jessie", jessie.name
  end
end
