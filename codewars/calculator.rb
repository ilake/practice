# http://www.codewars.com/kata/5235c913397cbf2508000048/solutions/ruby
require 'ruby-debug'
# class Calculator
#   def evaluate(string)
#     array = string.split(' ')
#     operators = string.scan(/[\*\/]/) + string.scan(/[\+\-]/)
#     operators.each do |operator|
#       array = process(array, operator)
#     end
#     array.at(0).to_i
#   end
# 
#   def process(array, operator)
#     if index = array.index(operator)
#       result = case operator
#                when '*'
#                  array[index-1].to_i * array[index+1].to_i
#                when '/'
#                  array[index-1].to_i / array[index+1].to_i
#                when '+'
#                  array[index-1].to_i + array[index+1].to_i
#                when '-'
#                  array[index-1].to_i - array[index+1].to_i
#                end
#       array.delete_at(index-1)
#       array.delete_at(index-1)
#       array[index-1] = result
#       array
#     else
#       array
#     end
#   end
# end

class Calculator
  def evaluate(string)
    [' + ', ' - ', ' * ', ' / '].each do |op|
      if string.include?(op)
        debugger
        return string.split(op).map { |s| evaluate(s) }.inject(op.strip)
      end
    end
    string.to_f
  end
end

# puts Calculator.new.evaluate("2 / 2 + 3 * 4 - 6") == 7
# puts Calculator.new.evaluate("2 + 3 * 4 / 3 - 6 / 3 * 3 + 8") == 8
puts Calculator.new.evaluate("3 * 4") == 12

