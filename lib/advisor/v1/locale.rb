require_relative '../../../helper/helper'

module Advisor
  module V1
    class Locale
      include Helper

      def initialize(token)
        @base = 'http://apiadvisor.climatempo.com.br/api/v1'
        @token = token
        @uri = "#{@base}/locale/city"
      end

      def search_city_by_name(name, state)
        response("#{@uri}?name=#{name}&state=#{state}&token=#{@token}").body
      end

      def search_city_by_id(id)
        response("#{@uri}/#{id}?token=#{@token}").body
      end
    end
  end
end
