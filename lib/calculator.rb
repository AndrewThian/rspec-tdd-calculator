class Calculator
  # read_only
  # attr_reader :result
  # see if tests pass even if i put accessor
  attr_accessor :result

  # your class goes here
  def initialize (cal_val=1)
    @result = cal_val
  end

  def reset(x)
    @result = x
  end
end
