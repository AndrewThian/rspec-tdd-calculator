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
    self
  end

  def sub(value)
    sub_val = value.to_i
    if sub_val != 0
      self.result -= sub_val
    else
      return 'Error'
    end
    self
  end

  def multiply(value)
    mult_val = value.to_i
    if mult_val != 0
      self.result *= mult_val
    else
      return 'Error'
    end
    self
  end

  def divide(value)
    div_val = value.to_i
    if div_val != 0
      self.result /= div_val
    else
      return 'Error'
    end
    self
  end

end

# raise 'An error'
