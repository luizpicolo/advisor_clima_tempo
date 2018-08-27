require_relative '../../../helper/helper'

module Advisor
  module V1
    class Weather
      include Helper

      def initialize(token)
        @base = 'http://apiadvisor.climatempo.com.br/api/v1'
        @token = token
        @uri = "#{@base}/weather/locale"
      end

      def weather_now(id)
        response("#{@uri}/#{id}/current?token=#{@token}").body
      end
    end
  end
end
