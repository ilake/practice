# encoding: UTF-8

puts "hello ümlaut".force_encoding("ISO-8859-1") + "hello ümlaut"

# Output
# incompatible character encodings: ISO-8859-1 and UTF-8 (Encoding::CompatibilityError)



# force_encoding simply tags the String with a different encoding,
# encode converts the bytes of one encoding into the equivalent bytes of the second
# force_encoding should almost never be used unless you know for sure that the bytes actually represent the characters you want in the target encoding
# encode is relatively safe to use to convert a String into the encoding you want.
