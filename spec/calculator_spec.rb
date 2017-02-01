require_relative 'spec_helper'
require_relative '../lib/calculator'

describe Calculator do
  before(:context) do
    # initialize calculator
    @my_calculator = Calculator.new(1)
  end

  # Tests go here
  describe "Initialization" do
    it "is an instance of the Calculator class" do
      expect(@my_calculator).to be_instance_of(Calculator)
    end
    it "should assign 1 to be the starting result of the new instance" do
      expect(@my_calculator.result).to eq(1)
    end
  end

  describe "Reading result" do
    it "would return the curent result" do
      expect(@my_calculator.result).to eq(1)
    end
    it "result should only be read_only" do
      @my_calculator.result = 2394 if respond_to? :result=
      expect(@my_calculator.result).to eq(1)
    end
  end

  describe "Reset" do
    it "should have a method reset" do
      expect(@my_calculator).to respond_to(:reset)
    end
    # checking for potato method
    # it "should not respond to random method" do
    #   expect(@my_calculator).to respond_to(:potato)
    # end
    it "should reset calculator" do
      @my_calculator.reset(2)
      expect(@my_calculator.result).to eq(2)
    end
  end

  describe "Addition" do
    it "should have a method add" do
      expect(@my_calculator).to respond_to(:add)
    end
    it "should raise an error if x is not valid" do
      expect(@my_calculator.add('string')).to raise_error
    end
    it "should add the value if x is valid" do
      @my_calculator.add(10)
      expect(@my_calculator.result).to be_a(Integer)
    end
  end
end
