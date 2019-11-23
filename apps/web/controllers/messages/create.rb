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
              optional(:hours_to_destroy).maybe(:int?)
              optional(:visits_limit).maybe(:int?)

              rule(hours_to_destroy_or_visits_limmit: [:hours_to_destroy, :visits_limit]) do |hour, visit|
                (hour.none?).then(visit.filled?) | (visit.none?).then(hour.filled?)
              end
            end
          end
        end

        def call(params)
          if params.valid?
            # prying(params)
            @message = MessageRepository.create(Message.new(params[:message]))
            self.body = render 'create.html.erb'
          else
            halt 404, "Link is wrong!"
        end
      end

      def prying(params)
        binding.pry
      end

      private

      def render(template)
        template = Hanami::View::Template.new(path(template))
        Web::Views::Messages::Create.new(template, {message: message, host: params.env["HTTP_HOST"]}).render
      end

      def path(file)
        Hanami.root.join(__dir__, "../..", 'templates/messages', file)
      end

  end
end
