# http://www.codewars.com/kata/52f787eb172a8b4ae1000a34/train/ruby
# http://www.purplemath.com/modules/factzero.htm

def zeros(n)
  cal(n, 1)
end

def cal(n, power)
  amount_of_five = n / (5**power)

  if amount_of_five == 0
    return amount_of_five
  else
    return amount_of_five + cal(n, power + 1)
  end
end

# Best Solution
def zeros(n)
  zeros = 0
  zeros += n /= 5 while n >= 1
  zeros
end
