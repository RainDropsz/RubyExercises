require './lib/calculator'

describe Calculator do
  describe "#add" do 
    it "returns the sum of two numbers" do 
      calculator = Calculator.new
      expect(calculator.add(5,2)).to eql(7)
    end
  end
end


# describe - defines a collection of tests 
# describe takes a class or string as an argument and is passed a block

# it - defines individual example 
# it takes a string and is passed a block

# Conventions
# #method used for instance methods
# .method used for class methods

# 1. describe class
# 2. describe method example group 
# 3. write your test case / example with it
# 4. write expectation using expect and .to / .not_to / .to_not
