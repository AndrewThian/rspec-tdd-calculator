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

    describe "Reset should reset calculator to default value" do
      it "should have a method reset" do
        @my_calculator.should respond_to :reset(1)
      end
end
