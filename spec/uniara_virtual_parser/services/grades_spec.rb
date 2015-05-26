require 'spec_helper'

module UniaraVirtualParser
  module Services
    describe Grades do
      describe '.grades' do
        let(:grades) { described_class.grades 'batman' }
        before do
          stub_request(:get, "http://virtual.uniara.com.br/alunos/consultas/notas/").
            to_return(:status => 200, body: uniara_virtual_fixture("grades.html").read, headers: {})
        end

        it 'fetches the content of uniara virtual and brings the array with grades' do
          expect(grades.first.name).to eq "ADMINISTRAÇÃO E ECONOMIA"
          expect(grades.length).to eq 14
        end
      end
    end
  end
end
