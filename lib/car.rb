class Car
	attr_accessor :brand, :color, :year_of_make

	def initialize(brand, color, year_of_make)
		@brand = brand
		@color = color
		@year_of_make = year_of_make
	end

	def car_details
		puts "The car is  #{@brand} manufactured in #{@year_of_make}"
	end
end
