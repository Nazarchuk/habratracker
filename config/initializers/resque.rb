require 'resque/server'

Resque.redis = "localhost:6379"

Resque.after_fork { ActiveRecord::Base.connection.reconnect! }

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

Rails.class_eval do
 def self.resque_logger
   Rails.logger
 end
end