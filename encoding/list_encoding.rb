# encoding: utf-8

encodings = Encoding.list.each.with_object({}) do |code, full_list|
  full_list[code.name] = [ code.name ]
end

Encoding.aliases.each do |alias_name, base_name|
  fail "#{base_name} #{alias_name}" unless encodings[base_name]
  encodings[base_name] << alias_name
end

# == Encoding aliases table ==
putsjencodings.values {|base_name, *| base_name.downcase }.map do |base_name, *rest|
  if rest.empty?
    base_name
  else
    "#{base_name} #{rest.join(', ')}"
  end
end


puts "File encoding is #{__ENCODING__}"

# will casue exception when encoding: sjis
# list_encoding.rb:24: invalid multibyte char (Windows-31J)
# list_encoding.rb:24: unterminated string meets end of file
puts "circle calculation need π"


# Show the difference between string, regexp and symbol
def show_encoding(str)
  puts "#{str.inspect} #{str.encoding.name}"
end

show_encoding('foo')
show_encoding(/foo/)
show_encoding(:foo)
show_encoding('π')
show_encoding(/π/)
show_encoding(:π)


