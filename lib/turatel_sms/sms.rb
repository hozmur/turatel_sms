module TuraTEL
	class SMS
		def self.send_sms(recipient, message_text, opts={})
			valid_options = opts.only(:from, :start_date, :stop_date, :turkish)
			valid_options.merge!(:start_date => TuraTEL::DATE.now) unless valid_options[:start_date]
			valid_options.merge!(:stop_date => TuraTEL::DATE.n_hour_from_now(1)) unless valid_options[:stop_date]

			body = TuraTEL::XmlBody.send_sms_body(recipient, message_text, valid_options)

			puts body if TuraTEL.configuration.debug

			response = send_request(body)

			result = parse_response(response)
			"result = #{result}"
		end

		def self.check_sms(msg_id)
			body = TuraTEL::XmlBody.check_sms_body(msg_id)

			puts body if TuraTEL.configuration.debug

			response = send_request(body)

			result = parse_response(response)
			"result = #{result}"
		end

		def sms_status
			'OK status'
		end

		def check_balance
			'OK Balance'
		end

		def initialize(auth_options={})
			@auth_options = auth_options
		end

		def self.send_request(body)
		    header = { 
		      "Content-Type" => "text/xml; charset=utf-8", 
		      "Content-Length" => body.bytesize.to_s, 
		      "Accept" => "*/*" 
		    }

		    request = Net::HTTP::Post.new('/xml/process.aspx', header)
		    request.body = body
		    #puts  "Request #{@header} #{request.body} "
		    response = Net::HTTP.new(TuraTEL.configuration.host, TuraTEL.configuration.port).start {|http| http.request(request) }
		    #puts "Response #{response.code} #{response.message}: #{response.body}"

		    # parser = XMLRPC::XMLParser::REXMLStreamParser::StreamListener.new
		    # parser.parse(response.body)

		    return response.body
		end

		def self.parse_response(body)
			body.split(" ")
		end
	end
end