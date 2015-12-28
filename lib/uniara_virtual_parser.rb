require 'hurley'
require 'nokogiri'
require 'uniara_virtual_parser/version'
require 'uniara_virtual_parser/client'
require 'uniara_virtual_parser/models/absence'
require 'uniara_virtual_parser/models/subject'
require 'uniara_virtual_parser/services/login'
require 'uniara_virtual_parser/services/grades'
require 'uniara_virtual_parser/services/absences'

include UniaraVirtualParser::Services::Login
include UniaraVirtualParser::Services::Grades
include UniaraVirtualParser::Services::Absences

module UniaraVirtualParser
  #
  # Main model. Includes methods from the services
  # Included:
  # login(ra, password) - Do the login in UniaraVirtual
  #
  # All Errors:
  # InvalidLogin: Raised when Login service receive invalid credentials.
  #
  class InvalidLogin < StandardError; end
end
