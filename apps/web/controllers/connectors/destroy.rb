module Web::Controllers::Connectors
  class Destroy
    include Web::Action

    def call(params)
      API::KafkaConnect.delete_connector(params[:id])
      redirect_to routes.connectors_path
    end
  end
end
