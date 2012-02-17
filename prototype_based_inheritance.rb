# Prototype based inheritance is in some respects more powerful then class-based inheritance
# because both the behavior AND the state of the object is inherited.
#
# In prototype based programming there is no distinction between Object and Class
#
# If you use .dup in ruby it does not copy the singleton methods of the class
# If you use .clone in ruby it copies the singleton methods


Animal = Object.new

def Animal.number_of_feet
  @number_of_feet
end

def Animal.number_of_feet=(feet)
  @number_of_feet = feet
end

def Animal.food
  @food
end

def Animal.food=(food)
  @food = food
end


Bird = Animal.clone
Bird.number_of_feet = 2

woodpecker = Bird.clone
woodpecker.food = 'insects'

p woodpecker