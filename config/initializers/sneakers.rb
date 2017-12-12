require 'sneakers'
require 'sneakers/runner'

Sneakers.configure  heartbeat: 2,
                    amqp: Rails.application.secrets.secret_cloudamqp_sneakers_amqp,
                    vhost: Rails.application.secrets.secret_cloudamqp_sneakers_vhost,
                    exchange: Rails.application.secrets.secret_cloudamqp_sneakers_exchange,
                    exchange_type: :direct

Sneakers.logger.level = Logger::INFO
