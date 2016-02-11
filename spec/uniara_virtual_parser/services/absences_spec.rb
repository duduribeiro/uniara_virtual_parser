require 'spec_helper'
require 'pry'
module UniaraVirtualParser
  module Services
    describe Absences do
      describe '.subject' do
        let(:subject) { described_class.absences 'batman' }
        before do
          stub_request(:get,"http://virtual.uniara.com.br/alunos/consultas/faltas").
            to_return(status: 200, body: uniara_virtual_fixture("absences.html").read, headers:{})
        end

        it 'fetches the content of uniara virtual and brings the array with absences' do
          binding.pry
          expect(subject.first.absences.first.name).to eq "REDES DE COMPUTADORES"
          expect(subject.first.absences.first.frequency).to eq "80h"
          expect(subject.length).to eq 2
        end
      end
    end
  end
end
