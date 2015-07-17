require 'spec_helper'

module UniaraVirtualParser
  module Services
    describe Files do
      describe '.files' do
        let(:files) { described_class.files 'batman' }
        before :each do
          stub_request(:get, "http://virtual.uniara.com.br/alunos/consultas/arquivos/").
            to_return(:status => 200, body: body, headers: {})
        end
        context 'when has 3 types of files' do
          let(:body) { uniara_virtual_fixture('files_model_1.html').read }
          it 'fetches the content of uniara virtual and brings the array with all files' do
            expect(files.length).to eq 3
            expect(files["COORDENAÇÃO"].first.name).to eq "REGULAMENTO TCC 2015"
          end
        end

        context 'when has 2 types of files' do
          let(:body) { uniara_virtual_fixture('files_model_2.html').read }
          it 'fetches the content of uniara virtual and brings the array with all files' do
            expect(files.length).to eq 8
            expect(files["COORDENAÇÃO"].first.name).to eq "REGULAMENTO TCC 2015"
          end
        end

      end
    end
  end
end
