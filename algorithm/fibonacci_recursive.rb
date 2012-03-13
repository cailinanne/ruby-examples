require 'test/unit'


class FibonacciRecursive

    @cache = {}

    def self.sequence(length)
        seq = []
        length.times{|n| seq << self.fibonacci(n) }
        seq
    end

    def self.fibonacci(n)
        return 0 if n == 0
        return 1 if n == 1

        unless @cache.include?(n)
            @cache[n] = self.fibonacci(n-1) + self.fibonacci(n-2)
        end

        @cache[n]
    end
end


class TestFibonacci < Test::Unit::TestCase

    def test_fibonacci
        assert_equal [0], FibonacciRecursive.sequence(1)
        assert_equal [0,1], FibonacciRecursive.sequence(2)
        assert_equal [0,1,1], FibonacciRecursive.sequence(3)
        assert_equal [0,1,1,2], FibonacciRecursive.sequence(4)
        assert_equal [0,1,1,2,3], FibonacciRecursive.sequence(5)
        assert_equal [0,1,1,2,3,5], FibonacciRecursive.sequence(6)
        assert_equal [0,1,1,2,3,5,8], FibonacciRecursive.sequence(7)

    end

end