module API
  class ParamsToKafka
    class << self
      def for_connector(params)
        config = {}

        params["config"].each_line do |line|
          line = line.strip
          config[line.split("=")[0]] = line.split("=")[1]
        end

        {
          name: params["name"],
          config: config
        }
      end
    end
  end
end
