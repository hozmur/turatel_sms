module TuraTEL
	class XmlBody
		def self.send_sms_body(recipient, message_text, valid_options)
			"<?xml version=\"1.0\" encoding=\"utf-8\" ?> 
<MainmsgBody>
<Command>0</Command>
<PlatformID>1</PlatformID>
<ChannelCode>#{TuraTEL.configuration.channel_code}</ChannelCode>
<UserName>#{TuraTEL.configuration.usercode}</UserName>
<PassWord>#{TuraTEL.configuration.password}</PassWord>
<Mesgbody>#{message_text}</Mesgbody>
<Numbers>#{recipient}</Numbers>
<Type>1</Type>
<Originator>#{valid_options[:from]}</Originator>
</MainmsgBody>"
		end

		def self.check_sms_body(msg_id)
			"<?xml version=\"1.0\" encoding=\"utf-8\" ?> 
<MainReportRoot>
<Command>3</Command>
<PlatformID>1</PlatformID>
<ChannelCode>#{TuraTEL.configuration.channel_code}</ChannelCode>
<UserName>#{TuraTEL.configuration.usercode}</UserName>
<PassWord>#{TuraTEL.configuration.password}</PassWord> 
<MsgID>#{msg_id}</MsgID>
</MainReportRoot>"
		end

		def self.get_credit
			"<?xml version=\"1.0\" encoding=\"utf-8\" ?>  
<MainReportRoot>
<Command>6</Command> 
<ChannelCode>#{TuraTEL.configuration.channel_code}</ChannelCode>
<UserName>#{TuraTEL.configuration.usercode}</UserName>
<PassWord>#{TuraTEL.configuration.password}</PassWord> 
</MainReportRoot>"			
		end
	end
end