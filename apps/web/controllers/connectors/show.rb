module Web::Controllers::Connectors
  class Show
    include Web::Action

    expose :connector

    def call(params)
      @connector = API::KafkaConnect.connector(params[:id])
    end
  end
end
