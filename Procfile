web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -d -L log/sidekiq.log --require config/environment.rb -c 2
