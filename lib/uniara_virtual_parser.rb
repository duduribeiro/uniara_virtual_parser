require 'hurley'
require 'uniara_virtual_parser/version'
require 'uniara_virtual_parser/client'
require 'uniara_virtual_parser/services/login'

include UniaraVirtualParser::Services::Login

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
