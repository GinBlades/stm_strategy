require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class Stm < OmniAuth::Strategies::OAuth2
      option :name, :stm

      uid {
        raw_info['id'] 
      }

      info do
        {
          email: raw_info['email'],
          admin: raw_info['admin']
        }
      end

      extra do
        {
          #current_sign_in_at: raw_info['extra']['current_sign_in_at'],
          #name: raw_info['extra']['name']
          #first_name: raw_info['extra']['first_name'],
          #:last_name  => raw_info['extra']['last_name']
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/oauth/me.json").parsed
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
    end
  end
end

