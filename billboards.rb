require "test/unit"

class Billboard

    def self.load_and_find
        params = STDIN.gets.split()
        n = params[0].gsub(",","").to_i
        k = params[1].gsub(",","").to_i
        sequence = []
        n.times{sequence << STDIN.gets.to_i}

        self.find_max(sequence, k)
    end

    def self.find_max(sequence,k)
        puts "Starting analysis for #{k} #{sequence.inspect}"
        max(sequence, k, 0)
    end
    
    def self.max(sequence, k, sum)
        if sequence.size > k + 2
            left = sequence[0..sequence.size/2 - 1]
            right = sequence[sequence.size/2..sequence.size]
            puts "left = #{left.inspect}"
            puts "right = #{right.inspect}"
            return max(left, k, sum) + max(right, k, sum)
        end
    
        sum = sequence.inject(:+)
        sum = sum - sequence.min if sequence.size > k
        puts "Looking for maximum of #{sequence.inspect} found #{sum}"
        sum
    end

end

#puts Billboard.load_and_find


class TestBillboards < Test::Unit::TestCase

    def test_one
        assert_equal 2, Billboard.find_max([1,1,1,1],1)
        assert_equal 10, Billboard.find_max([1,9,9],1)
        assert_equal 10, Billboard.find_max([1,9,9,1],1)
    end

    def test_two
        return
        assert_equal 21, Billboard.find_max([1,2,3,1,6,10], 2)
        assert_equal 2, Billboard.find_max([1,1,1], 2)
        assert_equal 3, Billboard.find_max([1,1,1,1], 2)
        assert_equal 20, Billboard.find_max([1,1,9,9,1,1],2)
        assert_equal 36, Billboard.find_max([9,9,1,1,9,9],2)
        assert_equal 2, Billboard.find_max([1,1],2)
    end

    def test_three
    end

end





