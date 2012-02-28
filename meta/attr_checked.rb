require 'test/unit'

module AttrChecked
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def attr_checked(method_name, &validation)
            define_method(method_name) do
                instance_variable_get("@#{method_name}")
            end

            define_method("#{method_name}=") do |val|
                raise ArgumentError if val.nil?

                unless validation.call(val)
                    raise ArgumentError
                end

                instance_variable_set("@#{method_name}", val)
            end
        end
    end
end

class Dog
    include AttrChecked

    attr_checked :num_legs do |v|
        v <= 4
    end
end

class TestDog < Test::Unit::TestCase

    def test_good_value
        dog = Dog.new
        dog.num_legs = 3

        assert_equal 3, dog.num_legs
    end

    def test_nil_value
        dog = Dog.new
        assert_raises ArgumentError do
            dog.num_legs = nil
        end
    end

    def test_illegal_value
        dog = Dog.new
        assert_raises ArgumentError do
            dog.num_legs = 5
        end
    end

end