class Calculator
  # read_only
  # attr_reader :result
  # see if tests pass even if i put accessor
  attr_accessor :result, :previous_result, :temp

  # your class goes here
  def initialize (cal_val=1)
    @result = cal_val
    @previous_result = cal_val
    @temp = nil
    puts "result: #{@result}"
    puts "previous_result: #{@previous_result}"
  end

  # methods
  def reset(x)
    @result = x
  end

  def add(value)
    add_val = value.to_i
    if add_val != 0
      self.previous_result = self.result
      puts "result: #{@result}"
      puts "previous_result: #{@previous_result}"
      self.result += add_val
    else
      return 'Error'
    end
    self
  end

  def sub(value)
    sub_val = value.to_i
    if sub_val != 0
      self.previous_result = self.result
      puts "result: #{@result}"
      puts "previous_result: #{@previous_result}"
      self.result -= sub_val
    else
      return 'Error'
    end
    self
  end

  def multiply(value)
    mult_val = value.to_i
    if mult_val != 0
      self.previous_result = self.result
      puts "result: #{@result}"
      puts "previous_result: #{@previous_result}"
      self.result *= mult_val
    else
      return 'Error'
    end
    self
  end

  def divide(value)
    div_val = value.to_i
    if div_val != 0
      puts "result: #{@result}"
      puts "previous_result: #{@previous_result}"
      self.previous_result = self.result
      puts "result: #{@result}"
      puts "previous_result: #{@previous_result}"
      self.result /= div_val
      puts "result: #{@result}"
      puts "previous_result: #{@previous_result}"
    else
      return 'Error'
    end
    self
  end

  def operation(oper,value)
    if value == nil
      return 'Error, second argument'
    end
    case oper
    when "add"
      self.add(value)
    when "sub"
      self.sub(value)
    when "multiply"
      self.multiply(value)
    when "divide"
      self.divide(value)
    end
  end

  def undo
    puts "result: #{@result}"
    puts "temp: #{@temp}"
    puts "previous_result: #{@previous_result}"
    self.temp = self.result
    self.result = self.previous_result
    self.previous_result = self.temp
    puts "result: #{@result}"
    puts "temp: #{@temp}"
    puts "previous_result: #{@previous_result}"
    return result
  end

  def redo
    if self.temp == nil
      return "Error, nothing to redo"
    else
      puts "result: #{@result}"
      puts "temp: #{@temp}"
      puts "previous_result: #{@previous_result}"
      self.temp = self.previous_result
      self.previous_result = self.result
      self.result = self.temp
      puts "result: #{@result}"
      puts "temp: #{@temp}"
      puts "previous_result: #{@previous_result}"
      self.temp = nil
      return result
    end
  end

end

# raise 'An error'
