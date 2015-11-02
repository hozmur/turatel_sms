module TuraTEL
  # Used to set up and modify settings for the notifier.
  class Configuration
  	attr_accessor  :host
  	attr_accessor  :port
  	attr_accessor  :usercode
    attr_accessor  :password
    attr_accessor  :channel_code
  	attr_accessor  :debug

  	def initialize
  		@host = 'processor.smsorigin.com'
  		@port = 80
  	end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end
end