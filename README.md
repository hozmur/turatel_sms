

require 'turatel_sms.rb'

TuraTEL.configure do |config|
	config.usercode = 'User'
	config.password = 'pass'
	config.channel_code = 555
	config.debug = false
end

puts TuraTEL::SMS.send_sms('1234567890','test',:from => 'SOURCE')

Versions
========
0.1
Initial Version


TODO
==========
- Message default times must be set for timezone
- Parameter validations must be added