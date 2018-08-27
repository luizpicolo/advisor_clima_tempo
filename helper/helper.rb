module Advisor
  module V1
    module Helper
      def response(uri)
        HTTParty.get(uri)
      end
    end
  end
end
