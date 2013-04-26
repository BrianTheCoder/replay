module Replay
  class Simulator
  	attr_accessor :notice

  	def initalize(notice)
  		@notice = notice
  	end

  	def run!
  		
  	end

  	protected

  	def self.client
      @client ||= Faraday.new do |conn|
        conn.use FaradayMiddleware::ParseXml
        conn.use FaradayMiddleware::Mashify
        conn.use FaradayMiddleware::Instrumentation
        conn.adapter Faraday.default_adapter
      end
    end
  end
end