class ExpiredWorker
  include Sidekiq::Worker

  def perform
    messages = MessageRepository.new.expired
    messages.each do |m|
      MessageRepository.new.delete(m.id)
    end
  end
end
