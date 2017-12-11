# Gemfile
gem 'bunny'

class PostsController < ApplicationController

  def publish
    connection = Bunny.new(host: Rails.application.secrets.secret_url_cloudamqp_bunny)
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
