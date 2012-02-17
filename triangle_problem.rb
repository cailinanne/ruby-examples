#    5
#   1 9
#  9 1 2
# 9 9 1 1


class Node
    attr_accessor :value, :parent, :left, :right
    def initialize(v, p, l, r)
        value=v
        parent=p
        left= l
        right= r
    end

    def to_s
        "#{parent} #{value} #{left} #{right}"
    end
end


n = Node.new 5, nil, 2, 3
puts n

puts "hello"

