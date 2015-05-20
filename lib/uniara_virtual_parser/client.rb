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
      attr_accessor :token

      private

      def client
        @client ||= Hurley::Client.new ENDPOINT
      end
    end
  end
end
