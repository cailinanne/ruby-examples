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
        log "Starting analysis for #{k} #{sequence.inspect}"

        sum = 0

        while sequence.inject(:+) > 0
            sections = get_sections(sequence, k)

            max_section = find_max_section(sections)
            log "The max section is #{max_section.inspect}"

            sum = sum + max_section.sum
            remove_section(sequence, max_section, k)

            log "The sequence is now #{sequence.inspect} and the current max sum is #{sum}"

        end

        sum

    end

    def self.get_sections(sequence, k)
        sections = Array.new
        sequence.each_with_index do  |val,i|
            sum =  sequence[i..i+(k-1)].inject(0){|sum,v| sum + v unless v.nil?}
            adjacent = (i - 1 >= 0 ? sequence[i-1] : 0 ) + ( sequence[i+k] || 0)
            sections <<  Section.new(i, sum, adjacent)
        end

        log "Sections = #{sections.inspect}"
        sections
    end

    def self.find_max_section(sections)
        max_sum_section = sections.max_by{|section| section.sum}

        max_sum_sections = sections.select{|section| section.sum == max_sum_section.sum}

        min_adjacent_section = max_sum_sections.min_by{|section| section.adjacent}


        max_sum_sections.find{|section| section.adjacent == min_adjacent_section.adjacent}
    end

    def self.remove_section(sequence, section, k)
        (section.position - 1 .. section.position + k).each do |i|
            if i >=0 and i < sequence.size
                sequence[i] = 0
            end
        end

    end

    def self.log(message)
        #puts message
    end

end

class Section

    attr_accessor :position, :sum, :adjacent
    def initialize(position, sum, adjacent)
        @position = position
        @sum = sum
        @adjacent = adjacent
    end

    def inspect
        "#{position} #{sum} #{adjacent}"
    end
end

#puts Billboard.load_and_find


class TestBillboards < Test::Unit::TestCase

    def test_simple
        assert_equal 1, Billboard.find_max([1],1)
        assert_equal 6, Billboard.find_max([1,2,3,4],1)
        assert_equal 8, Billboard.find_max([1,2,3,4],2)
        assert_equal 9, Billboard.find_max([1,2,3,4],3)
    end

    def test_one
        assert_equal 1, Billboard.find_max([1],1)
        assert_equal 2, Billboard.find_max([1,1,1,1],1)
        assert_equal 10, Billboard.find_max([1,9,9],1)
        assert_equal 10, Billboard.find_max([1,9,9,1],1)
    end

    def test_two
        assert_equal 2, Billboard.find_max([1,1],2)
        assert_equal 21, Billboard.find_max([1,2,3,1,6,10], 2)
        assert_equal 2, Billboard.find_max([1,1,1], 2)
        assert_equal 3, Billboard.find_max([1,1,1,1], 2)
        assert_equal 20, Billboard.find_max([1,1,9,9,1,1],2)
        assert_equal 36, Billboard.find_max([9,9,1,1,9,9],2)
        assert_equal 2, Billboard.find_max([1,1],2)
    end

    def test_three
        assert_equal 3, Billboard.find_max([1,1,1],3)
        assert_equal 56, Billboard.find_max([1,1,1,8,8,8,9,9,9,9,1,1,1,1],3)
    end

end





