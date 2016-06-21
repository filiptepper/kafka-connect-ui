module API
  class KafkaConnect
    class << self
      def connectors
        get("/connectors/")
      end

      def connector(name)
        get("/connectors/#{name}")
      end

      def connector_status(name)
        get("/connectors/#{name}/status")
      end

      def pause_connector(name)
        put("/connectors/#{name}/pause")
      end

      def restart_connector(name)
        post("/connectors/#{name}/restart")
      end

      def resume_connector(name)
        put("/connectors/#{name}/resume")
      end

      def create_connector(params)
        post("/connectors/", params)
      end

      def delete_connector(name)
        delete("/connectors/#{name}")
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

      def post(path, params = {})
        response = RestClient.post(
            url(path),
            params.to_json,
            accept: :json,
            content_type: :json
          )

        unless response.empty?
          JSON.parse(response)
        end
      end

      def put(path, params = {})
        RestClient.put(
          url(path),
          params.to_json,
          accept: :json,
          content_type: :json
        )
      end

      def delete(path)
        RestClient.delete(
          url(path),
          accept: :json,
          content_type: :json
        )
      end

      def url(path)
        "#{ENV["KAFKA_CONNECT_URL"]}#{path}"
      end
    end
  end
end
