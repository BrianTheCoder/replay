module Replay
  class Airbrake
    def self.setup(options)
      @account = options[:account]
      @auth_token = options[:auth_token]
    end

    def self.error(error_id)
      resp = client.get do |req|
        req.url "errors/#{error_id}.xml"
        req.params[:auth_token] = @auth_token
      end
      resp.body
    end

    def self.notices(error_id)
      resp = client.get do |req|
        req.url "errors/#{error_id}/notices.xml"
        req.params[:auth_token] = @auth_token
      end
      resp.body
    end

    protected

    def self.client
      @client ||= Faraday.new "https://#{@account}.airbrake.io" do |conn|
        conn.use FaradayMiddleware::ParseXml
        conn.use FaradayMiddleware::Mashify
        conn.use FaradayMiddleware::Instrumentation
        conn.adapter Faraday.default_adapter
      end
    end
  end
end