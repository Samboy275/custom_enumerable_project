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
