# Gemfile
gem 'bunny'

class PostsController < ApplicationController

  def publish
    connection = Bunny.new(host: 'spider.rmq.cloudamqp.com',
       :vhost => "ojsindrn",
       :user => "ojsindrn",
       :password => "ZIKUsMxhLMT5q8yXOag1AzMtiGI51h54")
    connection.start
    channel = connection.create_channel

    q = channel.queue("outrafila", :durable => true)
    msg  = ARGV.empty? ? "Outro teste" : ARGV.join(" ")

    q.publish(msg, :persistent => true)
    render json: {success: true, messagem: "#{msg}"}, status: 200
    sleep 1.0
    connection.close
  end
end
