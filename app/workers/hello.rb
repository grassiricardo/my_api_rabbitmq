class Hello
  include Sneakers::Worker
  from_queue 'grassi'

  def work(msg)
    puts " [x] Get #{msg}"
  end
end
