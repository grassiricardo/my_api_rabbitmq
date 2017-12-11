# Gemfile
gem 'bunny'

class PostsController < ApplicationController

  def publish
    connection = Bunny.new(host: 'spider.rmq.cloudamqp.com',
       :vhost => "ojsindrn",
       :user => "ojsindrn:ojsindrn",
       :password => "ZIKUsMxhLMT5q8yXOag1AzMtiGI51h54")
    connection.start
    channel = connection.create_channel

    q = channel.queue("teste", :durable => true)
    msg  = ARGV.empty? ? "Hello World!11111" : ARGV.join(" ")

    q.publish(msg, :persistent => true)
    puts " [x] Sent #{msg}"
    render json: {success: true}, status: 200, messagem: "#{msg}"

    sleep 1.0
    connection.close

  end
end
