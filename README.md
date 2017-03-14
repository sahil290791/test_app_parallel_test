# Test App

Adding --format progress to `.rspec` file causes the tests to run twice as shown below:
```
2 processes for 2 specs, ~ 1 specs per process
Randomized with seed 64609
Randomized with seed 64609

Car
  checks Ferrari's brand
.  check BMW's year of make
.

Top 2 slowest examples (0.00065 seconds, 36.9% of total time):
  Car checks Ferrari's brand
    0.00047 seconds ./spec/model_spec.rb:9
  Car check BMW's year of make
    0.00018 seconds ./spec/model_spec.rb:4

Finished in 0.00177 seconds (files took 0.1133 seconds to load)
2 examples, 0 failures

Finished in 0.00177 seconds (files took 0.1133 seconds to load)
2 examples, 0 failures

Randomized with seed 64609
Randomized with seed 64609

Randomized with seed 43282
Randomized with seed 43282

Car
  checks car's brand
.  checks car's year of make (FAILED - 1)
F

Failures:

  1) Car checks car's year of make
     Failure/Error: expect(bmw.color).to eq(2015)
     
       expected: 2015
            got: "black"
     
       (compared using ==)
     # ./spec/car_spec.rb:6:in `block (2 levels) in <top (required)>'

Failures:

  1) Car checks car's year of make
     Failure/Error: expect(bmw.color).to eq(2015)
     
       expected: 2015
            got: "black"
     
       (compared using ==)
     # ./spec/car_spec.rb:6:in `block (2 levels) in <top (required)>'

Top 2 slowest examples (0.01478 seconds, 33.1% of total time):
  Car checks car's year of make
    0.01422 seconds ./spec/car_spec.rb:4
  Car checks car's brand
    0.00056 seconds ./spec/car_spec.rb:9

Finished in 0.0447 seconds (files took 0.11617 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/car_spec.rb:4 # Car checks car's year of make

Finished in 0.0447 seconds (files took 0.11617 seconds to load)
2 examples, 1 failure

Failed examples:
rspec ./spec/car_spec.rb:4 # Car checks car's year of make
Randomized with seed 43282
Randomized with seed 43282

8 examples, 2 failures

Took 1 seconds
Tests Failed
```

There are only 2 specs in this project with a total of 4 examples. Presence of spec_helper.rb does not cause the specs to be printed twice.

If we remove `--format progress` from .rspec file then the result is as shown below:
```
2 processes for 2 specs, ~ 1 specs per process

Car
Car
  check BMW's year of make
  checks Ferrari's brand

Top 2 slowest examples (0.00106 seconds, 45.7% of total time):
  Car check BMW's year of make
    0.00088 seconds ./spec/model_spec.rb:4
  Car checks Ferrari's brand
    0.00017 seconds ./spec/model_spec.rb:9

Finished in 0.00231 seconds (files took 0.11056 seconds to load)
2 examples, 0 failures

  checks car's year of make (FAILED - 1)
  checks car's brand

Failures:

  1) Car checks car's year of make
     Failure/Error: expect(bmw.color).to eq(2015)
     
       expected: 2015
            got: "black"
     
       (compared using ==)
     # ./spec/car_spec.rb:6:in `block (2 levels) in <top (required)>'

Top 2 slowest examples (0.0166 seconds, 36.8% of total time):
  Car checks car's year of make
    0.01624 seconds ./spec/car_spec.rb:4
  Car checks car's brand
    0.00036 seconds ./spec/car_spec.rb:9

Finished in 0.04504 seconds (files took 0.11091 seconds to load)
2 examples, 1 failure

Failed examples:
rspec ./spec/car_spec.rb:4 # Car checks car's year of make
4 examples, 1 failure

Took 1 seconds
Tests Failed
```

So the tests were printed once on the screen.
The problem is with `--format progress` examples are printed twice with a output line like this: 
```
Finished in 0.04504 seconds (files took 0.11091 seconds to load)
4 examples, 1 failure
Finished in 0.04504 seconds (files took 0.11091 seconds to load)
4 examples, 1 failure
```
And then parallel_gems might be adding up and showing:
```
8 examples, 2 failures
```
