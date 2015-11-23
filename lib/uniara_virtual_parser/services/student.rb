module UniaraVirtualParser
  module Services
    module Student
      def student(token)
        response = Client.get_with_token('/alunos/index/', token)
        parse_student_profile response.body
      end

      private

      def parse_student_profile(html)
        doc      = Nokogiri::HTML(html)
        name = doc.css("b:contains('Bom Dia')").first
        return '' unless name
        student  = Models::Student.new(name: name.text.match(/Bom Dia, (.*)/)[1])
        student
      end
    end
  end
end
