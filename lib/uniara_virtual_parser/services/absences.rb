module UniaraVirtualParser
	module Services
		module Absences
		def absences(token)
			response = Client.get_with_token('/alunos/consultas/faltas',token)
			parse_absences response.body
		end

		private 

		def parse_absences(html)
			doc = Nokogiri::HTML(html)
			absences = []
			subjects = []
			
			doc.css('div#conteudo ~table tr').each_with_index do |absence,index|
				next if index.zero?
				absences << Models::Absence.new(
					frequency: 		absence.css('td:nth-child(2)').text,
					total:			absence.css('td:nth-child(3)').text
				)
				end
				subjects << Models::Subject.new(absences:absences)
			subjects
		end
		end
	end
end
