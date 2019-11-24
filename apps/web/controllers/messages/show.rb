module Web
  module Controllers
    module Messages
      class Show
        include Web::Action

        expose :message

        def call(params)
          if @message = MessageRepository.find_by_url(params[:url])
            if message.viewed?
            MessageRepository.delete(message)
              link_is_wrong
            else
              message.visits_count += 1
            end
            MessageRepository.update(message)
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
