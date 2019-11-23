module SelfDestructing
  require 'hanami/model'
  require 'hanami/mailer'
  require 'core_ext/integer'
  Dir["#{ __dir__ }/self_destructing/**/*.rb"].each { |file| require_relative file }
  Hanami::Model.configure do

  adapter type: :sql, uri: ENV['DATABASE_URL']

  migrations 'db/migrations'
  schema     'db/schema.sql'

  mapping do
   collection :messages do
     entity     Message
     repository MessageRepository

     attribute :id,   Integer
     attribute :text, String
     attribute :url, String
     attribute :time_of_destroy, DateTime
     attribute :visits_limit, Integer
     attribute :visits_count, Integer
     attribute :hours_to_destroy, Integer
   end
 end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/self_destructing/mailers"
  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :smtp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!

end
