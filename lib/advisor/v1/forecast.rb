require_relative '../../../helper/helper'

module Advisor
  module V1
    class Forecast
      include Helper
      
      def initialize(token)
        @base = 'http://apiadvisor.climatempo.com.br/api/v1'
        @token = token
        @uri = "#{@base}/forecast/locale"
      end

      def for_15_days(id)
        response("#{@uri}/#{id}/days/15?token=#{@token}").body
      end

      def for_72_hours(id)
        response("#{@uri}/#{id}/hours/72?token=#{@token}").body
      end
    end
  end
end
