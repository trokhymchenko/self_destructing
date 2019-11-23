module Web
  module Controllers
    module Messages
      class Create
        include Web::Action
        include Hanami::Validations

        expose :message

        validations do
          required(:text) { filled? & str? }
          params do
            require(:message).schema do
              require(:text).filled
              end
            end
          end
        end

        def call(params)
          if params.valid?
            prying(params)
            @message = MessageRepository.create(Message.new(params[:message]))
            redirect_to '/link'
          else
            self.status = 422
        end
      end

      def prying(params)
        binding.pry
    end
  end
end
