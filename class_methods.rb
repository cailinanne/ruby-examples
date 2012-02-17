# The following two ways of defining a class method are the same


class Dave

    class << self
        def hello
            "Hello"
        end
    end
end


class Peter
    def self.hello
        "hello"
    end
end


Dave.hello
Peter.hello