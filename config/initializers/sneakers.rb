require 'sneakers'
require 'sneakers/runner'

Sneakers.configure  :heartbeat => 2,
                    :amqp => Rails.application.secrets.secret_url_cloudamqp_sneakers,
                    :vhost => '/',
                    :exchange => 'sneakers',
                    :exchange_type => :direct,
                    :threads => 1,
                    :workers => 1

Sneakers.logger.level = Logger::INFO
