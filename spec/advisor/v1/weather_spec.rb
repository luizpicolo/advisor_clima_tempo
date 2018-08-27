RSpec.describe Advisor::V1::Weather do
  before do
    @weather = Advisor::V1::Weather.new(File.read('token'))
    @name = 'Nova Andradina'
    @state = 'MS'
    @id = '9091'
  end

  describe '#weather_now' do
    it "should not return a error" do
      VCR.use_cassette('weather/weather_now') do
        @json = JSON.parse(@weather.weather_now(@id))
        expect {@json}.not_to raise_error
      end
    end

    it "should return a hash containing weather now to city by id" do
      VCR.use_cassette('weather/weather_now') do
        @json = JSON.parse(@weather.weather_now(@id))
        expect(@json['name']).to eq(@name)
        expect(@json['state']).to eq(@state)
      end
    end
  end
end
