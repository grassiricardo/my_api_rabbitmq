require 'sneakers'
require 'sneakers/runner'

Sneakers.configure  :heartbeat => 2,
                    :amqp => 'amqp://ojsindrn:ZIKUsMxhLMT5q8yXOag1AzMtiGI51h54@spider.rmq.cloudamqp.com/ojsindrn',
                    :vhost => 'ojsindrn',
                    :exchange => 'sneakers',
                    :exchange_type => :direct

Sneakers.logger.level = Logger::INFO
