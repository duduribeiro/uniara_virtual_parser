module UniaraVirtualParser
  module Services
    module Login
      def login(ra, password)
        response = Client.post('/login', username: ra, senha: password)
        cookies  = response['Set-Cookie']

        fail InvalidLogin unless /UVXS233E3=S/.match cookies
        cookies.match(/PHPSESSID=([^;]*);/)[1]
      end
    end
  end
end
