# triangle
# ---
# Given a triangle of numbers, find the max sum that is possible from all the paths possible.
# 
# Exapmle:
#    1
#   9 2
#  4 6 17
#  
# Answer: 30 (1 + 2 + 17)

class Triangle

    attr_accessor :root, :depth

    def initialize(r, d)
        @root= r
        @depth=d
    end

    def left
        Triangle.new(root.left, depth - 1)
    end

    def right
        Triangle.new(root.right, depth - 1)
    end

end

class Node

    attr_accessor :value, :left, :right, :depth

    def initialize(v, l, r, d)
        @value = v
        @left = l
        @right = r
        @depth = d
    end

end


data = [
    [1],
    [9,2],
   [4,6,17],
  [20,2,3,4]
]

nodes = Array.new

data.each_with_index do |row, i|
    nodes << row.collect{|val| Node.new(val, nil, nil, i + 1)}
end

puts "#{nodes.inspect}"

nodes.each_with_index do |row, i|
    row.each_with_index do |node, j|
        node.left = nodes[i+1][j] unless nodes[i+1].nil?
        node.right = nodes[i+1][j+1] unless nodes[i+1].nil?
    end
end



def max_sum(triangle, sum)

    puts "Entering with sum = #{sum} and triangle = #{triangle.inspect}"

    if triangle.depth > 2
        return triangle.root.value + [max_sum(triangle.left, sum), max_sum(triangle.right, sum)].max
    end

    # Now we have a triangle of height 2 (e.g. a three element triad)
    sum + max_for_triad(triangle)
end

def max_for_triad(triangle)
    sum = triangle.root.value +  [triangle.root.left.value, triangle.root.right.value].max
    puts "Determining max for triad #{triangle.inspect} returning #{sum}"
    sum
end


triangle = Triangle.new(nodes[0][0], nodes.size)
puts max_sum(triangle, 0)






