module API
  class KafkaConnect
    class << self
      def connectors
        get("/connectors/")
      end

      def connector(name)
        get("/connectors/#{name}")
      end

      def create_connector(params)
        post("/connectors/", params)
      end

      def plugins
        get("/connector-plugins/")
      end

      private

      def get(path)
        JSON.parse(
          RestClient.get(
            url(path),
            accept: :json,
            content_type: :json
          )
        )
      end

      def post(path, params)
        JSON.parse(
          RestClient.post(
            url(path),
            params.to_json,
            accept: :json,
            content_type: :json
          )
        )
      end

      def url(path)
        "#{ENV["KAFKA_CONNECT_URL"]}#{path}"
      end
    end
  end
end
