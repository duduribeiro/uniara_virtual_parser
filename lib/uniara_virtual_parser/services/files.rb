module UniaraVirtualParser
  module Services
    module Files
      def files(token)
        response = Client.get_with_token('/alunos/consultas/arquivos/', token)
        parse_files response.body
      end

      private

      def parse_files(html)
        doc      = Nokogiri::HTML(html)
        files = []

        doc.css('div#conteudo ~ table').each do |table|
          #todo: create a class for each selector
          if table.css('b').first.text =~ /ARQUIVOS DISPONIBILIZADOS PELA/
            selector = ->(file) { "COORDENAÇÃO" }
            files << extract_files(table, selector)
          elsif table.css('tr td')[2].text == "Disciplina"
            selector = ->(file) { file.parent.parent.css('td:nth-child(2)').text }
            files << extract_files(table, selector)
          else
            selector = ->(file) do 
              tr = file.parent.parent
              until(tr.css('td:nth-child(2)').text == 'Tamanho')
                tr = tr.previous_element
              end
              tr.css('td:nth-child(1)').text
            end
            files << extract_files(table, selector)
          end
        end
        files.flatten.group_by(&:grade)
      end

      def extract_files(table, grade_selector = nil)
        table.css('a').map do |file|
          link = file.attribute('href').value.match(/abrearq\('(.*)'\)/)[1]
          grade = if grade_selector
                    grade_selector.call(file)
                  end
          Models::File.new(name: file.text, link: link, grade: grade)
        end
      end

    end
  end
end
