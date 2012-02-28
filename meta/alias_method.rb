require 'test/unit'

class Fixnum
    alias_method :old_plus, :+

    def +(value)
        self.old_plus(value).old_plus(1)
    end
end

class BackToKindergartenTest < Test::Unit::TestCase
    def test_plus_one
        assert_equal 3, 1 + 1
        assert_equal 5, 2 + 2
        assert_equal 1, -1 + 1
    end
end