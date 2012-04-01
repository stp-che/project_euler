# Problem 6
# Find the difference between the sum of the squares of the first one hundred natural numbers 
# and the square of the sum.

def squares_diff(n)
  (1..n).inject(:+)**2 - (1..n).map{|i| i*i}.inject(:+)
end

puts squares_diff(100)