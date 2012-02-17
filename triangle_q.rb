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

    # get root node of the triangle
    def root_node
    end

    # get the row at this depth as an array of nodes (from left to right)
    # depth 0 is the root node, depth 1 are the root's children, etc
    def row(depth)
    end

    # returns the max depth
    def max_depth
    end

    # @TODO
    def max_sum_1
    end

    # @TODO
    def max_sum_2
    end
end

class Node

    attr_accessor :value, :left, :right, :parent, :depth

    def initialize(v, l, r, p, d)
        value = v
        left = l
        right = r
        parent = p
        depth = d
    end
    # value of this node
    #def value
    #end

    # left child node
    #def left
    #end

    # right child node
    #def right
    #end

    # parent of this node
    #def parent
    #end

    # int depth of this node (0 is root)
    #def depth
    #end
end

#    1
#   9 2
#  4 6 8
# 1 2 3 4
#5 6 7 8 9

data = [
    [1],
    [9,2],
   [4,6,17],
  [20,2,3,4]
]

def max_sum(triangle, sum)

    puts "Entering with sum = #{sum} and triangle = #{triangle.inspect}"

    if triangle.size > 2
        triangle_left, triangle_right = split_triangle(triangle)
        puts "Split triangle #{triangle.inspect} into #{triangle_left.inspect} and #{triangle_right.inspect}"
        return triangle[0][0] + [max_sum(triangle_left, sum), max_sum(triangle_right, sum)].max
    end

    # Now we have a triangle of height 2 (e.g. a three element triad)
    sum + max_for_triad(triangle)
end

def max_for_triad(triad)
    sum = triad[0][0] +  [triad[1][0],triad[1][1]].max
    puts "Determining max for triad #{triad.inspect} returning #{sum}"
    sum
end

def split_triangle(triangle)
    left_triangle = Array.new
    right_triangle = Array.new
    triangle.each_with_index do |row, depth|
        if depth > 0
            left_triangle << row[0..(row.size - 2)]
            right_triangle << row[1..(row.size - 1)]
        end
    end
    [left_triangle,right_triangle]
end

puts max_sum(data, 0)





