gem 'bunny'

class BannyService
  def initialize(name_queue, message)
    @name_queue = name_queue
    @message = message
  end

  def publish
    begin
      queue = @connection.create_channel.queue(@name_queue, durable: true) if open_connection
      close_connection if queue.publish(@message, persistent: true)
    rescue Bunny::PreconditionFailed => e
      puts "Channel-level exception! Code: #{e.channel_close.reply_code},
      message: #{e.channel_close.reply_text}".squish
    end
  end

  private

  def open_connection
    begin
      @connection = Bunny.new(
        host: Rails.application.secrets.secret_cloudamqp_bunny_host,
        vhost: Rails.application.secrets.secret_cloudamqp_bunny_vhost,
        user: Rails.application.secrets.secret_cloudamqp_bunny_user,
        password: Rails.application.secrets.secret_cloudamqp_bunny_password
      ).start
    rescue Bunny::TCPConnectionFailed => e
      puts "Connection failed"
    end
  end

  def close_connection
    @connection.close
  end
end
