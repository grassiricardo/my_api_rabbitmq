require 'sneakers'
require 'sneakers/runner'

Sneakers.configure  :heartbeat => 2,
                    :amqp => 'spider.rmq.cloudamqp.com',
                    :vhost => 'ojsindrn',
                    :user => 'ojsindrn',
                    :password => 'ZIKUsMxhLMT5q8yXOag1AzMtiGI51h54',
                    :exchange => 'sneakers',
                    :exchange_type => :direct

Sneakers.logger.level = Logger::INFO
