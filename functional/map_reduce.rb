# Inject and reduce are synonyms
arr = [1,2,3]

sum = arr.inject(0){|n, sum| sum = sum + n}
puts sum

sum = arr.reduce(0){|n, sum| sum = sum + n}
puts sum


# Map and collect are synonyms

squares = arr.collect{|n| n * n}
puts squares.inspect

squares = arr.map{|n| n * n}
puts squares.inspect