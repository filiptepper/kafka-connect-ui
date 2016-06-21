module Web::Controllers::Connectors::Status
  class Show
    include Web::Action

    expose :connector_status

    def call(params)
      @connector_status = API::KafkaConnect.connector_status(params[:connector_id])
    end
  end
end
