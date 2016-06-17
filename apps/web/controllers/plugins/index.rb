module Web::Controllers::Plugins
  class Index
    include Web::Action

    expose :plugins

    def call(params)
      @plugins = ::API::KafkaConnect.plugins
    end
  end
end
