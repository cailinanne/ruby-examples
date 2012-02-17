module Math

    def self.included(cls)
        cls.extend ClassMethods
    end

    def squared
        self * self
    end

    module ClassMethods
        def pi
            "3.14"
        end
    end
end

class Fixnum
    include Math
end

puts 2.squared
# 4

puts Fixnum.pi
# 3.14
