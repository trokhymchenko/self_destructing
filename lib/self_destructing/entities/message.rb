class Message < Hanami::Entity
  attributes :id, :text, :url
  attr_accessor :url

  def url
    @url ||= SecureRandom.hex(8)
  end
end
