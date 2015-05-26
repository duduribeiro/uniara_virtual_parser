require 'spec_helper'

module UniaraVirtualParser
  describe Client do
    after :each do
      described_class.instance_variable_set :@client, nil
    end

    let(:client) { double(:client, post: true) }

    describe '.client' do
      it 'creates only one hurley_client object' do
        expect(Hurley::Client).to receive(:new).once { client }

        described_class.post '/batman'
        described_class.post '/batman'
      end
    end

    describe '.post' do
      it 'calls hurley_client and send the post' do
        expect(client).to receive(:post).with('/batman')
        allow(Hurley::Client).to receive(:new) { client }

        described_class.post '/batman'
      end
    end
  end
end
