module Web::Controllers::Connectors
  class Create
    include Web::Action

    expose :connector

    def call(params)
      @connector = params[:connector]
      API::KafkaConnect.create_connector(
        API::ParamsToKafka.for_connector(params[:connector])
      )

      redirect_to routes.connectors_path
    end
  end
end
