RSpec.describe Advisor::V1::Forecast do
  before do
    @forecast = Advisor::V1::Forecast.new(File.read('token'))
    @name = 'Nova Andradina'
    @state = 'MS'
    @id = 9091
  end

  describe '#for_15_days' do
    it "should not return a error" do
      VCR.use_cassette('forecast/api_15_days') do
        @json = JSON.parse(@forecast.for_15_days(@id))
        expect {@json}.not_to raise_error
      end
    end

    it "should return a hash containing forecasts for 15 days" do
      VCR.use_cassette('forecast/api_15_days') do
        @json = JSON.parse(@forecast.for_15_days(@id))
        expect(@json['name']).to eq(@name)
        expect(@json['state']).to eq(@state)
      end
    end
  end

  describe '#for_72_hours' do
    it "should not return a error" do
      VCR.use_cassette('forecast/api_72_hours') do
        @json = JSON.parse(@forecast.for_72_hours(@id))
        expect {@json}.not_to raise_error
      end
    end

    it "should return a hash containing forecasts for 72 hours" do
      VCR.use_cassette('forecast/api_72_hours') do
        @json = JSON.parse(@forecast.for_72_hours(@id))
        expect(@json['name']).to eq(@name)
      end
    end
  end
end
