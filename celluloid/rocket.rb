require 'celluloid'

class Rocket
  include Celluloid

  def initialize(autolaunch = false)
    async.launch if autolaunch
  end

  def launch
    3.downto(1) do |n|
      puts "#{n}..."
      sleep 1
      raise 'Booooooooooooooooooom!!'  if [true, false].sample
    end

    puts "Blast off!"  
  end
end

class Launcher
  include Celluloid
  # triggered when a linked actor dies.
  trap_exit :recover

  def launch_rocket
    # use new_link when Rocket crash, Launcher will crash too.
    Rocket.new_link.async.launch
    # Rocket.new.async.launch
  end

  def recover(actor, failure_reason)
    puts "Recovering"
    # launch_rocket
  end
end
