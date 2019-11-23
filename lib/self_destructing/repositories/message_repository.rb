class MessageRepository < Hanami::Repository
  def self.find_by_url(url)
    query do
      where(url: url)
    end.first
  end
end
