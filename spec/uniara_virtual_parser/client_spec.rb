require 'spec_helper'

module UniaraVirtualParser
  describe Client do
    after :each do
      described_class.instance_variable_set :@client, nil
    end

    let(:client) { double(:client, post: true) }

    describe '.post' do
      it 'calls HTTParty and send the post' do
        expect(Net::HTTP).to receive(:post_form)

        described_class.post '/batman'
      end
    end
  end
end
