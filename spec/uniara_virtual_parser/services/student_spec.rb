require 'spec_helper'

module UniaraVirtualParser
  module Services
    describe Student do
      describe '.student' do
        let(:student) { described_class.student 'theimp' }
        before do
          stub_request(:get, "http://virtual.uniara.com.br/alunos/index/").
            to_return(:status => 200, body: uniara_virtual_fixture("index.html").read, headers: {})
        end

        it 'fetches the content of uniara virtual and brings the student profile' do
          expect(student.name).to eq "TYRION LANNISTER"
        end
      end
    end
  end
end
