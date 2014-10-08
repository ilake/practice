# encoding: ascii-8bit

puts "File encoding #{__ENCODING__}"


pi = 'Zrušiť'
p pi.encoding.name

s = "string".force_encoding("UTF-8")

p s.encoding.name

c = "#{s}#{pi}"
p c.encoding.name
