require_relative 'spec_helper'
require_relative '../lib/calculator'

describe Calculator do
  before(:context) do
    # initialize calculator
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
end
