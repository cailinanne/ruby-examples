# implement a postfix calculator
# Read about Reverse Polish Notation: http://en.wikipedia.org/wiki/Reverse_Polish_notation
# Try a Reverse Polish Calculator : http://linuxfocus.org/~guido/javascript/rpnjcalc.html
require "test/unit"
class Postfix
    # @TODO
    # evaluate the string expression
    # spaces delimit the operators and operands
    # ex: 1 2 +                             1 + 2
    # ex: 10 3 2 * -                        10 - (3 * 2
    # ex. 8 2 + 10 /                        (8 + 2) / 10
    # ex. 2 4 3 * 6 / +                     2 + 4 * 3 / 6
    # ex. 300 23 + 43 21 - * 84 7 + /       (300+23)*(43-21)/(84+7)

    def self.evaluate(postfix)
        eval(Postfix.translate(postfix))
    end

    def self.translate(postfix)
        stack = Array.new

        postfix.split().each do |token|
            if Postfix.numeric?(token)
                stack.push(token)
            else

                puts "stack = #{stack.inspect}"

                rhs = stack.pop()
                lhs = stack.pop()

                if lhs.nil?
                    sub_expression = rhs
                else
                    sub_expression = "(#{lhs} #{token} #{rhs})"
                end


                stack.push(sub_expression)
            end
        end

        stack.join()

    end

    private

    def self.numeric?(object)
        true if Float(object) rescue false
    end
end


class TestPostfix < Test::Unit::TestCase

    def test_translate
        assert_equal "(1 + 2)", Postfix.translate("1 2 +")
        assert_equal "(10 - (3 * 2))", Postfix.translate("10 3 2 * -")
        assert_equal "((8 + 2) / 10)", Postfix.translate("8 2 + 10 /")
        assert_equal "(2 + ((4 * 5) / 6))", Postfix.translate("2 4 5 * 6 / +")
    end

    def test_evaluate
        assert_equal 3, Postfix.evaluate("1 2 +")
        assert_equal 4, Postfix.evaluate("10 3 2 * -")
        assert_equal 1, Postfix.evaluate("8 2 + 10 /")
        assert_equal 4, Postfix.evaluate("2 4 3 * 6 / +")
        assert_equal 78, Postfix.evaluate("300 23 + 43 21 - * 84 7 + /")
    end

end