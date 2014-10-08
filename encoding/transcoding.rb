# encoding: ascii-8bit
#
# I want to test is there any different if I don't assign the src_encoding in encode method

original = "ol\xe9"
puts original.bytes.to_a
puts original.encoding

# transcoding.rb:10:in `encode': "\xE9" from ASCII-8BIT to UTF-8 (Encoding::UndefinedConversionError)`
# new = original.encode('utf-8')
new = original.encode('utf-8', 'iso-8859-1')
puts new.bytes.to_a
puts new.encoding
