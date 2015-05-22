require 'resque/tasks'
require 'resque/scheduler/tasks'

Resque.redis = 'localhost:6379'

namespace :resque do
  task :setup do
    Resque.enqueue_in(1.minutes, Poster)
  end
end