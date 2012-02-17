nums = [1,2,3,4]

sum =  nums.inject(0){|sum,i| sum = sum + i}

puts sum