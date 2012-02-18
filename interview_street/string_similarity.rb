require "test/unit"

DEBUG = false


class TestStringSimilarity < Test::Unit::TestCase
    def test_similarity
        return unless DEBUG
        assert_equal 1, StringSimilarity.similarity("a","a")
        assert_equal 6, StringSimilarity.similarity("ababaa","ababaa")
        assert_equal 0, StringSimilarity.similarity("ababaa","babaa")
        assert_equal 3, StringSimilarity.similarity("ababaa","abaa")
        assert_equal 0, StringSimilarity.similarity("ababaa","baa")
        assert_equal 1, StringSimilarity.similarity("ababaa","aa")
        assert_equal 1, StringSimilarity.similarity("ababaa","a")
    end

    def test_full
        return unless DEBUG
        assert_equal [11,3], StringSimilarity.run_examples(["ababaa","aa"])
    end

end



class StringSimilarity

    def self.load
        num_example = STDIN.gets.to_i
        examples = []
        num_example.times{examples << STDIN.gets.strip}

        self.run_examples(examples)
    end

    def self.run_examples(examples)
        output = Array.new
        examples.each{|example| output << calculate_similarity(example)}
        log "The output is #{output.inspect}"
        output
    end

    def self.calculate_similarity(example)
        log "Calculating similarity for [#{example}]"
        total = 0
        (0..example.size-1).each do |i|
            total = total + self.similarity(example, example[i..example.size-1])
        end
        total
    end

    def self.similarity(s1, s2)
        count = 0
        while count < s2.length && s1[count] == s2[count]
            count = count + 1
        end
        count
    end

    def self.log(message)
        puts message if DEBUG
    end

end

unless DEBUG
    output = StringSimilarity.load
    output.each {|o| puts o}
end