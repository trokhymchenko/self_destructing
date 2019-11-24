desc "Delete expired messages"
task :delete_messages => :environment do
  ExpiredWorker.perform_async
  puts "done."
end
