require 'test/unit'

class String
    def substr(needle)
        self.substr_rabin_karp(needle)
    end

    # O(nm)
    def substr_naive(needle)
        (0..self.size-1).each do |offset|
            break if offset + needle.size > self.size

            same = true
            (0..needle.size-1).each do |i|
                unless self[offset + i] == needle[i]
                    same = false
                    break
                end
            end

            return offset if same
        end

        nil
    end

=begin
    function RabinKarp(string s[1..n], string sub[1..m])
      hsub := hash(sub[1..m]);  hs := hash(s[1..m])
      for i from 1 to n-m+1
          if hs = hsub
              if s[i..i+m-1] = sub
                  return i
          hs := hash(s[i+1..i+m])
      return not found
=end

    # Typicall O(n+m)
    def substr_rabin_karp(needle)
        puts "Looking for #{needle} in #{self}"
        h_needle = needle.hash
        (0..(self.size - needle.size)).each do |i|
            sub = self.slice(i,i + needle.size)
            h_sub = sub.hash
            if h_needle == h_sub
                return i if needle == sub
            end
        end


        return nil
    end
end

class TestDog < Test::Unit::TestCase

    def test_substr
        assert_equal "dog".index("dog"), "dog".substr("dog")
        assert_equal "dog".index("og"), "dog".substr("og")
        assert_equal "alphadog".index("dog"), "alphadog".substr("dog")
        assert_equal "dog".index("cat"), "dog".substr("cat")
    end
end