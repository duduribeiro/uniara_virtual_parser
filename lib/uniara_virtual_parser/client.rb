require 'net/http'
module UniaraVirtualParser
  #
  # This module handle the connections between all services and the
  # UniaraVirtual server
  #
  class Client
    ENDPOINT = 'http://virtual.uniara.com.br'

    class << self
      def get_with_token(path, token)
        uri = URI("#{endpoint}#{path}")
        req = Net::HTTP::Get.new(uri)
        req['Cookie'] = "PHPSESSID=#{token};"
        res = Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
        end
      end

      def post(path, body=nil)
        uri = URI("#{endpoint}#{path}")
        Net::HTTP.post_form(uri, body)
      end

      def configure_endpoint(endpoint)
        @endpoint = endpoint
      end

      private

      def endpoint
        @endpoint || ENDPOINT
      end
    end
  end
end
