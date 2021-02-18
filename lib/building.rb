class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.filter_map do |unit|
      unit.renter.name if !unit.renter.nil?
    end
  end

  def average_rent
    total_rent = @units.sum do |unit|
      unit.monthly_rent
    end

    total_rent/renters.count.to_f
  end

  def rented_units
    @units.select do |unit|
      unit.renter
    end
  end

  def renter_with_highest_rent
    rented_units.max do |unit1, unit2|
      unit1.monthly_rent <=> unit2.monthly_rent
    end.renter
  end

  def units_by_number_of_bedrooms
    @units.reduce({}) do |acc, unit|
      acc[unit.bedrooms] ||= []
      acc[unit.bedrooms] << unit.number
      acc
    end
  end

  def annual_breakdown
    rented_units.reduce({}) do |acc, unit|
      acc[unit.renter.name] = unit.monthly_rent * 12
      acc
    end
  end

  def rooms_by_renter
    rented_units.reduce({}) do |acc, unit|
      acc[unit.renter] = {
        bathrooms: unit.bathrooms,
        bedrooms: unit.bedrooms
      }
      acc
    end
  end
end
