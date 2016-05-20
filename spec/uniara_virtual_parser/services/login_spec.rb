require 'spec_helper'

module UniaraVirtualParser
  module Services
    describe Login do
      let(:body) do
        { 'senha' => 'wayne', 'username' => 'bruce' }
      end

      let(:response_headers) do
        {
          'Set-Cookie' => 'PHPSESSID=64sbv9srm10tove94kn7nutfb2;'\
          'path=/, UVXS233E3=N; expires=Wed, 20-May-2015 02:32:01 GMT,'\
          'tipoAcesso=virtual; expires=Thu, 21-May-2015 04:32:01 GMT;'\
          "path=/; domain=.uniara.com.br, #{logged_session}"\
          'expires=Wed, 20-May-2015 05:32:01 GMT; path=/'
        }
      end

      before do
        stub_request(:post, 'http://virtual.uniara.com.br/login')
          .with(body: body)
          .with(:body => {"senha"=>"wayne", "username"=>"bruce"})
          .to_return(status: 200, body: '', headers: response_headers)
      end

      context 'with a valid login' do
        let(:logged_session) { 'UVXS233E3=S;' }

        it 'returns the token in the Client' do
          expect(described_class.login 'bruce', 'wayne').to be
        end
      end

      context 'with an invalid login' do
        let(:logged_session) { '' }

        it 'raises InvalidLogin error' do
          expect { described_class.login 'bruce', 'wayne' }
            .to raise_error(UniaraVirtualParser::InvalidLogin)
        end
      end
    end
  end
end
