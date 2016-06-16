module Web::Controllers::Connectors
  class Index
    include Web::Action

    expose :connectors

    def call(params)
      @connectors = ::API::KafkaConnect.connectors
    end
  end
end
