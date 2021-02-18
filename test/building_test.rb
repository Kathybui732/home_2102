require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'
require './lib/renter'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
    @renter1 = Renter.new("Aurora")
    @renter2 = Renter.new("Tim")
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    @renter3 = Renter.new("Spencer")
    @renter4 = Renter.new("Jessie")
    @renter5 = Renter.new("Max")
  end

  def test_it_exists_with_attributes
    assert_instance_of Building, @building
  end

  def test_it_starts_with_no_units_until_added
    assert_equal [], @building.units
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal [@unit1, @unit2], @building.units
  end

  def test_it_can_get_builiding_average
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal [], @building.renters
    @unit1.add_renter(@renter1)
    assert_equal ["Aurora"], @building.renters

    @unit2.add_renter(@renter2)
    assert_equal ["Aurora", "Tim"], @building.renters

    assert_equal 1099.5, @building.average_rent
  end

  def test_it_can_get_rented_units
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)

    assert_equal [], @building.rented_units

    @unit2.add_renter(@renter3)
    assert_equal [@unit2], @building.rented_units
  end

  def test_it_can_get_renter_with_highest_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter3)
    assert_equal @renter3, @building.renter_with_highest_rent

    @unit1.add_renter(@renter4)
    assert_equal @renter4, @building.renter_with_highest_rent

    @unit3.add_renter(@renter5)
    assert_equal @renter4, @building.renter_with_highest_rent
  end

  def test_it_can_get_units_by_number_if_bedrooms
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @building.add_unit(@unit4)
    expected = {
      3 => ["D4" ],
      2 => ["B2", "C3"],
      1 => ["A1"]
    }

    assert_equal expected, @building.units_by_number_of_bedrooms
  end

  def test_it_can_get_annual_breakdown
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter3)
    expected1 = {"Spencer" => 11988}
    assert_equal expected1, @building.annual_breakdown

    @unit1.add_renter(@renter4)
    expected2 = {"Jessie" => 14400, "Spencer" => 11988}
    assert_equal expected2, @building.annual_breakdown
  end

  def test_it_can_get_rooms_by_renter
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter3)
    @unit1.add_renter(@renter4)
    
    expected = {
      @renter4 => {bathrooms: 1, bedrooms: 1},
      @renter3 => {bathrooms: 2, bedrooms: 2}
    }
    assert_equal expected, @building.rooms_by_renter
  end
end
