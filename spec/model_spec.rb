require_relative '../lib/car'

describe Car do
	it "check BMW's year of make" do
		bmw = Car.new('BMW', 'green', 2014)
		expect(bmw.year_of_make).to eq(2014)
	end

	it "checks Ferrari's brand" do
		bmw = Car.new('Ferrari', 'black', 2015)
		expect(bmw.brand).to eq('Ferrari')
	end
end
