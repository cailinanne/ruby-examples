module Math

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def pi
      3.14
    end
  end

  def squared
    self * self
  end
end

class Fixnum
  include Math
end

puts Fixnum.pi
puts 2.squared