require 'test/unit'

class FactorialRecursive
    def self.factorial(n)
        return 1 if n == 1

        n * factorial(n-1)
    end
end

class FactorialIterative
    def self.factorial(n)
        (1..n).inject(1){|sum, i| sum * i}
    end
end


class TestFactorial < Test::Unit::TestCase

    def test_factorial_recursive
        assert_equal 1, FactorialRecursive.factorial(1)
        assert_equal 2, FactorialRecursive.factorial(2)
        assert_equal 6, FactorialRecursive.factorial(3)
        assert_equal 24, FactorialRecursive.factorial(4)
    end

    def test_factorial_iterative
        assert_equal 1, FactorialIterative.factorial(1)
        assert_equal 2, FactorialIterative.factorial(2)
        assert_equal 6, FactorialIterative.factorial(3)
        assert_equal 24, FactorialIterative.factorial(4)
    end

end