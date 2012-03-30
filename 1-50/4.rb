# encoding: utf-8

# Problem 4
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.


class ::String
  def palindrom?
    return true if self.size < 2
    self[0] == self[-1] && self[1..-2].palindrom?
  end
end

class ::Numeric
  def palindrom?
    self.to_s.palindrom?
  end
end

def get_answer(given_low_bound=100, given_up_bound=999)
  low_bound = given_low_bound
  up_bound = given_up_bound
  max_found_palindrom = 0
  loop do
    j = up_bound
    while j >= low_bound
      mult = up_bound * j
      if mult.palindrom? && max_found_palindrom < mult
        max_found_palindrom = mult
        low_bound = j
      end
      j -= 1
    end
    up_bound -= 1
    break if up_bound < low_bound
  end
  p [low_bound, max_found_palindrom/low_bound]
  max_found_palindrom
end

def benchmark(n=100)
  t = Time.now.to_f
  n.times{ get_answer }
  Time.now.to_f - t
end
