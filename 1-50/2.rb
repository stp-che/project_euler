# Problem 2
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms

top = 4000000
sum = 0
a = 1
b = 2
while b < top
  sum += b if b%2 == 0
  a, b = b, a+b
end
puts sum