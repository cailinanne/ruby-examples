# How would you implement Ruby's attr_accessor?
# 
# ie:
# class Abc
#   attr_accessor :name
# end
# 
# such that:
# a = Abc.new
# a.name = 'joe'
# puts a.name

module AccessMe
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def my_attr_accessor(m)
      define_method(m) do
        instance_variable_get("@#{m}")
      end

      define_method("#{m}=") do |val|
        instance_variable_set("@#{m}", val)
      end
    end
  end
end

class Cat
  include AccessMe
  my_attr_accessor :name
end

cat = Cat.new
cat.name = "Fredrick"
puts cat.name