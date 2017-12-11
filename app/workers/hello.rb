class Hello
  include Sneakers::Worker
  from_queue 'teste'

  def work(msg)
    puts " [x] Get #{msg}"
  end
end
