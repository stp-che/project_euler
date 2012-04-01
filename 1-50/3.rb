# Problem 3
# What is the largest prime factor of the number 600851475143 ?

require File.expand_path(File.dirname(__FILE__) + '/../lib/ruby/primes/lib/primes')

puts 600851475143.prime_factors.last
