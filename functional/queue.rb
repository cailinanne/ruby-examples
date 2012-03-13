require 'test/unit'
# Queue means FIFO
class Queue

    def initialize
        @arr = []
    end

    def add(element)
        @arr << element
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
        q = Queue.new
        q.add(1)
        q.add(2)
        assert_equal [1,2], q.all
        assert_equal 1, q.next
        assert_equal [2], q.all
    end

end