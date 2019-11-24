module Web
  module Controllers
    module Messages
      class Show
        include Web::Action

        expose :message

        def call(params)
          if @message = MessageRepository.new.find_by_url(params[:url])
            if message.viewed?
            MessageRepository.new.delete(message)
              link_is_wrong
            else
              MessageRepository.new.update(message.id, visits_count: message.visits_count + 1)
            end
          else
            link_is_wrong
          end
        end

        private

        def link_is_wrong
          self.status = 404
          self.body = "Link is worng!"
        end
      end
    end
  end
end
