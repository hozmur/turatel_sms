Gem::Specification.new do |s|
  s.name        = 'turatel_sms'
  s.version     = '0.1.4'
  s.date        = '2015-10-26'
  s.summary     = "SMS sender for Turkey TuraTEL!"
  s.description = "This gem is for sending SMS using TuraTEL services"
  s.authors     = ["IPOS - Huseyin Gomleksizoglu"]
  s.email       = 'huseyin.gomleksizoglu@ipos.com.tr'
  s.files       = ["lib/turatel_sms.rb","lib/core-ext/hash.rb", "lib/turatel_sms/configuration.rb", "lib/turatel_sms/sms.rb", "lib/turatel_sms/date.rb", "lib/turatel_sms/xml_body.rb"]
  s.homepage    =
    'http://rubygems.org/gems/turatel_sms'
  s.license       = 'MIT'
end