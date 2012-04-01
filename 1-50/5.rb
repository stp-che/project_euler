# Problem 5
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require File.expand_path(File.dirname(__FILE__) + '/../lib/ruby/primes/lib/primes')

def divisible(bound)
  factors = []
  Primes.below bound do |prime|
    factor = prime
    while factor <= bound/prime
      factor *= prime
    end
    factors << factor
  end
  factors.inject :*
end

puts divisible(20)