# http://www.linuxprogrammingblog.com/threads-and-fork-think-twice-before-using-them
# http://www.jonathanhui.com/ruby-process-thread-network-os-command
# The thread calling fork is the only thread in the created child process. fork doesn’t copy other threads.
thread = Thread.new { }
thread2 = Thread.new { }

fork {
  t = Thread.new {
    puts "in child process #{Thread.list.count}"
  }
  t.join
}

puts "in main process #{Thread.list.count}"
loop { true }
