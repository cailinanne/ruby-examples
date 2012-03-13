require 'test/unit'

s = "abcd"
puts s
puts s[2].to_s

class String
    def alt_reverse
        word = ""
        chars = self.each_char.to_a
        chars.size.times { word << chars.pop }
        word
    end

    def reverse_in_place
        length = self.size

        (0..(length/2 - 1)).each do |i|
            self[i], self[length - i - 1] = self[length - i - 1], self[i]
        end

        self
    end
end


class TestReverser < Test::Unit::TestCase

    def test_alt_reverse
        assert_equal "god", "dog".alt_reverse
        assert_equal "tac", "cat".alt_reverse
        assert_equal "abcdefg", "gfedcba".alt_reverse
    end

    def test_reverse_in_place
        assert_equal "abcd", "dcba".reverse_in_place
        assert_equal "god", "dog".reverse_in_place
        assert_equal "tac", "cat".reverse_in_place
        assert_equal "abcdefg", "gfedcba".reverse_in_place
    end
end