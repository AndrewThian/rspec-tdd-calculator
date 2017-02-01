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
    it "should have a method sub" do
      expect(@my_calculator).to respond_to(:add)
    end
    it "should raise an error if x is not valid" do
      expect(@my_calculator.add('string')).to eq('Error')
    end
    it "should add the value if x is valid" do
      @my_calculator.add(10)
      expect(@my_calculator.result).to eq(12)
    end
  end

  describe "Subtraction" do
    it "should have a method sub" do
      expect(@my_calculator).to respond_to(:sub)
    end
    it "should raise an error if x is not valid" do
      expect(@my_calculator.sub('string')).to eq('Error')
    end
    it "should subtract the value if x and return a negative number" do
      @my_calculator.reset(0)
      @my_calculator.sub(10)
      expect(@my_calculator.result).to eq(-10)
    end
    it "should subtract the value if x and return a positive number" do
      @my_calculator.reset(12)
      @my_calculator.sub(3)
      expect(@my_calculator.result).to eq(9)
    end
  end

  describe "Multiply" do
    it "should have a method multiply" do
      expect(@my_calculator).to respond_to(:multiply)
    end
    it "should raise an error if x is not valid" do
      expect(@my_calculator.multiply('string')).to eq('Error')
    end
    it "should multiply the value if x is valid" do
      @my_calculator.reset(0)
      @my_calculator.multiply(0)
      expect(@my_calculator.result).to eq(0)
    end
  end

  describe "Divide" do
    it "should have a method divide" do
      expect(@my_calculator).to respond_to(:divide)
    end
    it "should raise an error if x is not valid" do
      expect(@my_calculator.divide('string')).to eq('Error')
    end
    it "should divide the value if x is valid" do
      @my_calculator.reset(8)
      @my_calculator.divide(4)
      expect(@my_calculator.result).to eq(2)
    end
    it "should say 'Error' if passed in value is 0" do
      expect(@my_calculator.divide(0)).to eq('Error')
    end
  end

  describe "Chain" do
    it "should allow chaining and not return an error" do
      @my_calculator.reset(1)
      expect(@my_calculator.add(5).sub(3).multiply(2).divide(3).result).to eq(2)
    end
  end

  describe "Operation" do
    it "should have a method operation" do
      expect(@my_calculator).to respond_to(:operation)
    end
    it "should accept two arguments" do
      @my_calculator.reset(1)
      expect(@my_calculator.operation('add', nil)).to eq('Error, second argument')
    end
    it "should accomplish add method based on string provided" do
      @my_calculator.reset(1)
      @my_calculator.operation('add', 10)
      expect(@my_calculator.result).to eq(11)
    end
    it "should accomplish sub method based on string provided" do
      @my_calculator.reset(1)
      @my_calculator.operation('sub', 10)
      expect(@my_calculator.result).to eq(-9)
    end
    it "should accomplish multiply method based on string provided" do
      @my_calculator.reset(1)
      @my_calculator.operation('multiply', 10)
      expect(@my_calculator.result).to eq(10)
    end
    it "should accomplish divide method based on string provided" do
      @my_calculator.reset(10)
      @my_calculator.operation('divide', 2)
      expect(@my_calculator.result).to eq(5)
    end
  end

  describe "Undo" do
    it "should have a method operation" do
      expect(@my_calculator).to respond_to(:undo)
    end
    it "should allow the undo method to execute properly" do
      @my_calculator.undo
      expect(@my_calculator.result).to eq(10)
    end
  end

  describe "Redo" do
    it "should have a method operation" do
      expect(@my_calculator).to respond_to(:redo)
    end
    it "should allow the undo method to execute properly" do
      @my_calculator.redo
      expect(@my_calculator.result).to eq(5)
    end
    it "should throw an error if there isnt a redo" do
      expect(@my_calculator.redo).to eq("Error, nothing to redo")
    end
  end
end
