require_relative '../lib/car'

describe Car do
	it "checks car's year of make" do
		bmw = Car.new('BMW', 'black', 2015)
		expect(bmw.color).to eq(2015)
	end

	it "checks car's brand" do
		bmw = Car.new('BMW', 'black', 2015)
		expect(bmw.brand).to eq('BMW')
	end
end
