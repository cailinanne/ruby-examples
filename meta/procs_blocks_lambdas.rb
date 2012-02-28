# In Ruby, there are three methods for converting a block into a Proc object (see below).  Discuss the
# differences between these three choices

b1 = Proc.new{|x| x + 1}
b2 = lamba{|x| x + 1}
b3 = proc{|x| x + 1 }


# In Ruby 1.9 proc is a synonym for Proc.new
# Proc objects created by lambda are typically called "lambdas"
# Proc objects created by Proc.new are typically called "procs"
# 1. Return statements
# - If return is called in a lamba, it returns from the block
# - If return is called in a proc, it returns from the method calling the block
# 2. Arity
# - Lambdas are picky about arity (like methods) and will cause an error if the arity of the .call method does not match the lambda definition
# - Procs are tolerant of mis-matched arity