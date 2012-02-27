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


    def attr_accessor(name)
        define_method(m) do
            instance_variable_get("@#{m}")
        end

        define_method("#{m}=") do |val|
            instance_variable_set("@#{m}", val)
        end
    end
end

class Example
    include AccessMe
    attr_accessor :cat
end


e = Example.new
e.cat = "miaow"
p e.cat