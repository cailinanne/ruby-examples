# The following code will fail with a NoMethodError :  private method 'dream' called for Dog
#
# Assuming that you cannot modify the source code for the Dog class and that the method
# must remain private - how can you nonetheless call this method from outside of Dog class?
class Dog
    def speak
        puts "woof"
    end

    private

    def dream
        puts "chasing a rabbit"
    end
end

dog = Dog.new
dog.speak
dog.dream

#dog.send(:dream)