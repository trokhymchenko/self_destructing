class MessageRepository < Hanami::Repository
  def find_by_url(url)
    messages.where(url: url).first
  end

  def expired
    messages.where { time_of_destroy <= Time.now }
  end
end
