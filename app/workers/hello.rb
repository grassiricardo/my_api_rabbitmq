class Hello
  include Sneakers::Worker
  from_queue 'outrafila'

  def work(msg)
    puts " [x] Get #{msg}"
  end
end
