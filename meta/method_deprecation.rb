require 'test/unit'

class Dog

    def has_spots?
        true
    end

    def woof
        "woof"
    end

    def self.deprecate(old_method, new_method)
        define_method(old_method) do |*args, &block|
            warn "Warning: #{old_method} is deprecated, use #{new_method}"
            send(new_method, *args, &block)
        end
    end

    deprecate :say_Woof, :woof
    deprecate :GetHasSpots, :has_spots?
end



class TestDog < Test::Unit::TestCase

    def test_deprecation
        dog = Dog.new
        assert_equal true, dog.GetHasSpots
        assert_equal "woof", dog.say_Woof
    end

end
