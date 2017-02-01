class Calculator
  # read_only
  # attr_reader :result
  # see if tests pass even if i put accessor
  attr_accessor :result

  # your class goes here
  def initialize (cal_val=1)
    @result = cal_val
  end

  # methods
  def reset(x)
    @result = x
  end

  def add(value)
    add_val = value.to_i
    if add_val != 0
      self.result += add_val
    else
      return 'Error'
    end
  end

end

# raise 'An error'
