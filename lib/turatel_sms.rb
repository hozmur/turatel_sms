require 'net/http'
require 'net/https'
require 'core-ext/hash'

require 'turatel_sms/configuration'
require 'turatel_sms/sms'
require 'turatel_sms/date'
require 'turatel_sms/xml_body'

module NetGSM
  def self.root
    File.expand_path('../..', __FILE__)
  end
end

