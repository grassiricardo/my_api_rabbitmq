gem 'bunny'

class BannyService
  def initialize(name_queue, message)
    @name_queue = name_queue
    @message = message
  end

  def publish
    open_connection
    queue = @channel.queue(@name_queue, durable: true)
    queue.publish(@message, persistent: true)
    sleep 1.0
    close_connection
  end

  private

  def open_connection
    @connection = Bunny.new(
      host: Rails.application.secrets.secret_cloudamqp_bunny_host,
      vhost: Rails.application.secrets.secret_cloudamqp_bunny_vhost,
      user: Rails.application.secrets.secret_cloudamqp_bunny_user,
      password: Rails.application.secrets.secret_cloudamqp_bunny_password
    )
    @connection.start
    @channel = @connection.create_channel
  end

  def close_connection
    @connection.close
  end
end
