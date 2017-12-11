require 'sneakers'
require 'sneakers/runner'

Sneakers.configure  :heartbeat => 2,
                    :amqp => Rails.application.secrets.secret_url_cloudamqp_sneakers,
                    :vhost => '/',
                    :exchange => 'sneakers',
                    :exchange_type => :direct
                    
Sneakers.logger.level = Logger::INFO
