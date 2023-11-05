module Enumerable
  # Your code goes here
  def my_select(&block)
    # implemented this method using the explicit block catching technique
    return self unless block_given?
    selected = []
    for i in 0..self.length-1
      selected << self[i] if block.call(self[i])
    end
    return selected
  end

  def my_all?(&block)
    all_match = true
    return all_match unless block_given?
    for i in 0..self.length-1
      all_match = block.call(self[i])
      break unless all_match == true
    end
    return all_match
  end

  def my_any?(&block)
    return true unless block_given?
    any_match = false
    for i in 0..self.length-1
      any_match = block.call(self[i])
      return any_match unless any_match ==  false
    end
    return any_match
  end

  def my_count
    return self.length unless block_given?
    counted = 0
    for i in 0..self.length-1
      counted += 1 if yield(self[i])
    end
    return counted
  end

  def my_each_with_index
    return self unless block_given?
    for i in 0..self.length-1
      yield(self[i], i)
    end
    return self
  end

  def my_inject(initial_value)
    output = initial_value
    for i in 0..self.length-1
      output = yield(output, self[i])
    end
    return output
  end

  def my_map
    return self unless block_given?
    output = []
    for i in 0..self.length-1
      output << yield(self[i])
    end
    return output
  end

  def my_none?(element=nil)
    unless block_given?
      return false if element == nil
      return !self.include?(element)
    end
    none = true
    for i in 0..self.length-1
      none = false if yield(self[i])
      break unless none
    end
    return none
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..self.length-1
      yield(self[i])
    end
    return self
  end
end
