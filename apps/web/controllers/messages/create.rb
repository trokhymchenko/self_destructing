module Web
  module Controllers
    module Messages
      class Create
        include Web::Action
        include Hanami::Validations

        expose :message

        validations do
          required(:text) { filled? & str? }
        end

        def call(params)
          if params.valid?
            @message = MessageRepository.create(Message.new(params[:message]))
            redirect_to '/'
          else
            self.status = 422
        end
      end

      def prying(params)
        binding.pry
    end
  end
end
