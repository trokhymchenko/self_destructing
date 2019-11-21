module Web
  module Controllers
    module Messages
      class New
        include Web::Action

        expose :message

        def call(params)
          @message = Message.new
        end
      end
    end
  end
end
