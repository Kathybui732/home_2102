# Market Street Apartments

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below using TDD.
* Commit your tests BEFORE you commit your implementations to ensure TDD
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
* Put your name in your PR!

## Iteration 1

Use TDD to create a Renter class and an Apartment class that respond to the following interaction pattern:

```ruby
pry(main)> require './lib/renter'
# => true

pry(main)> require './lib/apartment'
# => true

pry(main)> renter1 = Renter.new("Jessie")
# => #<Renter:0x00007a15c93af80...>

pry(main)> renter1.name
# => "Jessie"

pry(main)> unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x00007fb3ecaae7c0...>

pry(main)> unit1.number
# => "A1"

pry(main)> unit1.monthly_rent
# => 1200

pry(main)> unit1.bathrooms
# => 1

pry(main)> unit1.bedrooms
# => 1

pry(main)> unit1.renter
# => nil

pry(main)> unit1.add_renter(renter1)

pry(main)> unit1.renter
# => #<Renter:0x00007fb3ee106ce8...>
```

## Iteration 2

Use TDD to create a Building class that responds to the following interaction pattern.

```ruby
pry(main)> require './lib/renter'
# => true

pry(main)> require './lib/apartment'
# => true

pry(main)> require './lib/building'
# => true

pry(main)> building = Building.new
# => #<Building:0x00007f83778c5a80...>

pry(main)> building.units
# => []

pry(main)> unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x00007f8377209bb0...>

pry(main)> unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
# => #<Apartment:0x00007f83779f0900...>

pry(main)> building.add_unit(unit1)

pry(main)> building.add_unit(unit2)

pry(main)> building.units
# => [#<Apartment:0x00007f8377209bb0...>, #<Apartment:0x00007f83779f0900...>]

pry(main)> building.renters
# => []

pry(main)> renter1 = Renter.new("Aurora")
# => #<Renter:0x00007fa83bc37978...>

pry(main)> unit1.add_renter(renter1)

pry(main)> building.renters
# => ["Aurora"]

pry(main)> renter2 = Renter.new("Tim")
# => #<Renter:0x00007fa83b9b0358...>

pry(main)> unit2.add_renter(renter2)

pry(main)> building.renters
# => ["Aurora", "Tim"]

pry(main)> building.average_rent
# => 1099.5
```

## Iteration 3

Use TDD to update your Building class so that it responds to the following interaction pattern. Note that the `renter_with_highest_rent` method should ignore units with no renter.

```ruby
pry(main)> require './lib/building'
# => true

pry(main)> require './lib/renter'
# => true

pry(main)> require './lib/apartment'
# => true

pry(main)> building = Building.new
# => #<Building:0x00007fa83bb74928...>

pry(main)> unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x00007fa83baae8b8...>

pry(main)> unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
# => #<Apartment:0x00007fa83bc777d0...>

pry(main)> unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
# => #<Apartment:0x00007fa83bc777d0...>

pry(main)> unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
# => #<Apartment:0x00007fa83bc777d0...>

pry(main)> renter1 = Renter.new("Spencer")
# => #<Renter:0x00007fa83bc37978...>

pry(main)> building.add_unit(unit1)

pry(main)> building.add_unit(unit2)

pry(main)> building.add_unit(unit3)

pry(main)> building.rented_units
# => []

pry(main)> unit2.add_renter(renter1)

pry(main)> building.rented_units
# => [#<Apartment:0x00007fa83bc777d0...>]

pry(main)> building.renter_with_highest_rent
# => #<Renter:0x00007fa83bc37978...>

pry(main)> renter2 = Renter.new("Jessie")
# => #<Renter:0x00007fa83b9b0358...>

pry(main)> unit1.add_renter(renter2)

pry(main)> building.renter_with_highest_rent
# => #<Renter:0x00007fa83b9b0358...>

pry(main)> renter3 = Renter.new("Max")
# => #<Renter:0x00007fa83b7t0456...>

pry(main)> unit3.add_renter(renter3)

pry(main)> building.renter_with_highest_rent
# => #<Renter:0x00007fa83b9b0358...>

pry(main)> building.add_unit(unit4)

pry(main)> building.units_by_number_of_bedrooms
# =>
# {
#   3 => ["D4" ],
#   2 => ["B2", "C3"],
#   1 => ["A1"]
# }
```

## Iteration 4

Use TDD to add an `annual_breakdown` method to your Building class. This method should associate a renter name with the amount they pay in rent for the whole year. Note that the `annual_breakdown` method should ignore units with no renter. Your Building class should now respond to the following interaction pattern:

```ruby
pry(main)> require './lib/building'
# => true

pry(main)> require './lib/apartment'
# => true

pry(main)> require './lib/renter'
# => true

pry(main)> building = Building.new
# => #<Building:0x00007fb333c0cec8...>

pry(main)> unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x00007fb333bcd840...>

pry(main)> unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
# => #<Apartment:0x00007fb333a55008...>

pry(main)> unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
# => #<Apartment:0x00007fa83bc777d0...>

pry(main)> renter1 = Renter.new("Spencer")
# => #<Renter:0x00007fb333d0d7f0...>

pry(main)> building.add_unit(unit1)

pry(main)> building.add_unit(unit2)

pry(main)> building.add_unit(unit3)

pry(main)> unit2.add_renter(renter1)

pry(main)> building.annual_breakdown
# => {"Spencer" => 11988}

pry(main)> renter2 = Renter.new("Jessie")
# => #<Renter:0x00007fb333af5a80...>

pry(main)> unit1.add_renter(renter2)

pry(main)> building.annual_breakdown
# => {"Jessie" => 14400, "Spencer" => 11988}

pry(main)> building.rooms_by_renter
#=> {<Renter:0x00007fb333af5a80...> => {bathrooms: 1, bedrooms: 1},
#    #<Renter:0x00007fb333d0d7f0...> => {bathrooms: 2, bedrooms: 2}}

```
