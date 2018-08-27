require_relative '../../../helper/helper'

module Advisor
  module V1
    class History
      include Helper

      def initialize(token)
        @base = 'http://apiadvisor.climatempo.com.br/api/v1'
        @token = token
        @uri = "#{@base}/history/locale"
      end

      def historic(id, from, to)
        response("#{@uri}/#{id}?token=#{@token}&from=#{from}&to=#{to}").body
      end
    end
  end
end
