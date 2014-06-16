thread = Thread.new do
  open('foo') {|f| f.read }  # Open & read a file in a thread
end

data = thread.value             # Store the file data
puts data
