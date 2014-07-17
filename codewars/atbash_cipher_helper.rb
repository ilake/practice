# http://www.codewars.com/kata/52f2f5ecc807c0ab1a00001a/solutions/ruby

class AtbashCipher
  def initialize(characters)
    @char_array = characters.split('')
    @length = @char_array.size
  end

  def encode(str)
    str.split('').map do |c|
      mapping(c)
    end.join
  end
  alias_method :decode, :encode

  def mapping(character)
    position = @char_array.index(character)
    return character unless position
    @char_array.at(@length - position - 1)
  end
end

# Best solution
class AtbashCipher
  def initialize(abc)
    @abc = abc
  end
  def encode(str)
    str.tr @abc, @abc.reverse
  end
  alias_method :decode, :encode
end
