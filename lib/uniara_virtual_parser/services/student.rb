module UniaraVirtualParser
  module Services
    module Student
      def student(token)
        response = Client.get_with_token('/alunos/index/', token)
        parse_student_profile response.body
      end

      private

      def parse_student_profile(html)
        return '' if html.empty?
        doc      = Nokogiri::HTML(html)
        student  = Models::Student.new(name: name.text.match(/Bo[am] [Dia|Tarde|Noite], (.*)/)[1])
        student
      end
    end
  end
end
