module UniaraVirtualParser
  module Services
    module Grades
      def grades(token)
        response = Client.get_with_token('/alunos/consultas/notas/', token)
        parse_grades response.body
      end

      private

      def parse_grades(html)
        doc      = Nokogiri::HTML(html)
        subjects = []

        doc.css('div#conteudo ~ table tr').each_with_index do |subject, index|
          next if index.zero?

          subjects << Models::Subject.new(
            name:             subject.css('td:nth-child(1)').text,
            first_bimester:   subject.css('td:nth-child(2)').text,
            second_bimester:  subject.css('td:nth-child(3)').text,
            third_bimester:   subject.css('td:nth-child(4)').text,
            fourth_bimester:  subject.css('td:nth-child(5)').text,
            substitutive:     subject.css('td:nth-child(6)').text,
            average:          subject.css('td:nth-child(7)').text,
            recovery:         subject.css('td:nth-child(8)').text,
            status:           subject.css('td:nth-child(9)').text
          )
        end
        subjects
      end
    end
  end
end
