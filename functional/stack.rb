require 'test/unit'
# Stack means LIFO
class Stack

    def initialize
        @arr = []
    end

    def add(element)
        @arr.unshift(element)
    end

    def next
        @arr.shift
    end

    def all
        @arr
    end
end

class TestQueue < Test::Unit::TestCase

    def test_queue
        s = Stack.new
        s.add(1)
        s.add(2)
        assert_equal [2,1], s.all
        assert_equal 2, s.next
        assert_equal [1], s.all
    end

end