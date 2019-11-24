require 'core_ext/integer'

class Message < Hanami::Entity

  # attributes :id, :text, :url, :time_of_destroy, :visits_limit, :visits_count, :hours_to_destroy
  def initialize(attributes = {})
    super(
      {
        url: url_hash,
        time_of_destroy: attributes[:hours_to_destroy].nil? ? nil : Time.now + attributes[:hours_to_destroy].hours
      }.merge(attributes)
    )
  end

  def url_hash
    @url ||= SecureRandom.hex(8)
  end

  # def time_of_destroy
  #   unless hours_to_destroy.nil?
  #     @time_of_destroy ||= Time.now + hours_to_destroy.hours
  #   end
  # end

  def viewed?
    visits_count == visits_limit
  end
end
