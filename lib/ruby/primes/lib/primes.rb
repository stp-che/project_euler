class Primes
  include Enumerable

  @@sequence = [2,3,5]

  class << self

    def get(index)
      calculate_to(index) if @@sequence.length <= index
      @@sequence[index]
    end
    alias :[] :get

    def take(length)
      ret = new(:index_bound => length-1)
      block_given? ? ret.each{|i| yield(i)} : ret
    end

    def below(value)
      ret = new :value_bound => value-1
      block_given? ? ret.each{|i| yield(i)} : ret
    end

    private
  
      def calculate_to(index)
        (index-@@sequence.length+1).times{ calculate_next }
      end

      def calculate_next
        number = @@sequence.last + 2
        while has_factors_in_sequence?(number)
          number += 2
        end
        @@sequence << number
      end

      def has_factors_in_sequence?(number)
        i = 0
        upper_bound = Math.sqrt(number) + 1
        while @@sequence[i] < upper_bound
          return true if number % @@sequence[i] == 0
          i += 1
        end
        false
      end

  end

  def initialize(opts={})
    @index_bound = opts[:index_bound]
    @value_bound = opts[:value_bound]
  end

  def each(&block)
    i = 0
    while in_bounds?(i)
      yield Primes[i]
      i += 1
    end
  end

  private

    def in_bounds?(i)
      (@index_bound.nil? || i <= @index_bound) && (@value_bound.nil? || Primes[i] <= @value_bound)
    end

end

class ::Integer

  def prime?
    return false if self < 2
    Primes.below(Math.sqrt(self)+1).each do |prime|
      return false if self % prime == 0
    end
    true
  end

  def prime_factors
    factors = []
    n = self.abs
    return factors if n < 2
    Primes.below n do |prime|
      while n % prime == 0
        n /= prime
        factors << prime unless factors.include?(prime)
      end
      if prime > Math.sqrt(n)
        factors << n if n > 1
        return factors
      end
    end
    factors << self if factors.empty?
  end

end
