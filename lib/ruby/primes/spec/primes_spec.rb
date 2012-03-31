$:.unshift(File.expand_path('../lib', File.dirname(__FILE__)))

require 'rubygems'

require 'rspec'
require 'rspec/autorun'
require 'primes'

describe Primes do

  describe ".get(N)" do
    it "should return the Nth element of prime numbers sequence (starting from 0)" do
      Primes.get(0).should == 2
      Primes.get(10).should == 31
    end
  end

  describe ".[](N)" do
    it "should work like 'get(N)'" do
      Primes[0].should == 2
      Primes[5].should == 13
    end
  end

  describe ".take" do

    it "should return an enumerator over first N prime numbers" do
      Primes.take(5).inject(:+).should == 28 
    end

    it "should handle block" do
      arr = []
      Primes.take 5 do |n|
        arr << n
      end
      arr.should == [2,3,5,7,11]
    end

  end

  describe ".below" do

    it "should return an enumerator over all prime numbers below N" do
      Primes.below(19).to_a.should == [2,3,5,7,11,13,17]
    end

    it "should handle block" do
      arr = []
      Primes.below 10 do |i|
        arr << i
      end
      arr.should == [2,3,5,7]
    end

  end

  describe "enumerator with index bound" do

    it "should take first N prime numbers" do
      p_enum = Primes.new :index_bound => 6
      p_enum.to_a.should == [2,3,5,7,11,13,17]
    end

  end

  describe "enumerator with value bound" do
    it "should take all prime numbers less then or equal to N" do
      p_enum = Primes.new :value_bound => 37
      p_enum.to_a.should == [2,3,5,7,11,13,17,19,23,29,31,37]
    end
  end

end

describe Integer, "#prime?" do

  it "should be true for prime numbers" do
    2.prime?.should be_true
    13.prime?.should be_true
    31.prime?.should be_true
  end

  it "should be false fro non prime numbers" do
    -2.prime?.should be_false
    1.prime?.should be_false
    111.prime?.should be_false
  end

end
