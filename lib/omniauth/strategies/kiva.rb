require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Kiva < OmniAuth::Strategies::OAuth
      option :name,           "kiva"

      option :client_options, {
        :scheme             => :header,
        :site               => 'https://api.kivaws.org',
        :authorize_url      => 'https://www.kiva.org/oauth/authorize',
        :request_token_path => '/oauth/request_token',
        :access_token_path  => '/oauth/access_token',
        :proxy              => ENV['http_proxy'] ? URI(ENV['http_proxy']) : nil
      }
      
      uid { access_token.params[:id] = raw_info['user_account']['id'] }

      def request_phase
        params = {}
        params[:client_id]      = options[:consumer_key]
        params[:client_secret]  = options[:consumer_secret]
        params[:scope]          = options[:scope]
        params[:oauth_callback] = options[:redirect_url] || 'oob'
        params[:response_type]  = 'code'
        params[:type]           = 'web_server'

        options[:authorize_params] = params
        super
      end

      info do
        a = raw_info['user_account']
        {
          :user_id      => a['id'],
          :first_name   => a['first_name'],
          :last_name    => a['last_name'],
          :lender_id    => a['lender_id'],
          :is_public    => a['is_public']
        }
      end

      extra do
        { 'raw_info' => 'raw_info' }
      end

      def raw_info
        @raw_info ||= MultiJson.load(access_token.get("#{options[:client_options][:site]}/v1/my/account.json").body)
        @raw_info
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
    end
  end
end
OmniAuth.config.add_camelization 'kiva', 'Kiva'