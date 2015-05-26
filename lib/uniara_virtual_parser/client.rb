module UniaraVirtualParser
  #
  # This module handle the connections between all services and the
  # UniaraVirtual server
  #
  class Client
    ENDPOINT = 'http://virtual.uniara.com.br'
    class << self
      extend Forwardable
      def_delegators :client, :post

      def get_with_token(path, token)
        client.get(path) do |request|
          request.header[:cookie] = "PHPSESSID=#{token};"
        end
      end

      private

      def client
        @client ||= Hurley::Client.new ENDPOINT
      end
    end
  end
end
