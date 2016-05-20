module UniaraVirtualParser
  #
  # This module handle the connections between all services and the
  # UniaraVirtual server
  #
  class Client
    ENDPOINT = 'http://virtual.uniara.com.br'
    class << self
      def get_with_token(path, token)
        HTTParty.get("#{ENDPOINT}#{path}", headers: { "cookie" => "PHPSESSID=#{token};" })
      end

      def post(path, body=nil)
        HTTParty.post("#{ENDPOINT}#{path}", body: body)
      end
    end
  end
end
