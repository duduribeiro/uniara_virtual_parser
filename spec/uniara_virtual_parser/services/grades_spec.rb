require 'spec_helper'

module UniaraVirtualParser
  module Services
    describe Grades do
      describe '.grades' do
        it 'fetch the content of uniara virtual and bring the array with grades' do
          stub_request(:get, "http://virtual.uniara.com.br/alunos/consultas/notas/").
            to_return(:status => 200, body: uniara_virtual_fixture("grades.html").read, headers: {})
          grades = described_class.grades 'batman'
          expect(grades.first.name).to eq "ADMINISTRAÇÃO E ECONOMIA"
          expect(grades.length).to eq 14
        end
      end
    end
  end
end
