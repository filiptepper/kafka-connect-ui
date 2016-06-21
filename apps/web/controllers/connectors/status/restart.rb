module Web::Controllers::Connectors::Status
  class Restart
    include Web::Action

    def call(params)
      API::KafkaConnect.restart_connector(params[:connector_id])
      redirect_to routes.connector_stati_path(params[:connector_id])
    end
  end
end
