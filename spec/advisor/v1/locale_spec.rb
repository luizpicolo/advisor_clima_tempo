RSpec.describe Advisor::V1::Locale do
  before do
    @locale = Advisor::V1::Locale.new(File.read('token'))
    @name = 'Nova Andradina'
    @state = 'MS'
    @id = '9091'
  end

  describe '#search_city_by_name' do
    it "should not return a error" do
      VCR.use_cassette('locale/search_city_by_name') do
        @json = JSON.parse(@locale.search_city_by_name(@name, @state))
        expect {@json}.not_to raise_error
      end
    end

    it "should return a hash containing data to city by name" do
      VCR.use_cassette('locale/search_city_by_name') do
        @json = JSON.parse(@locale.search_city_by_name(@name, @state))
        expect(@json[0]['name']).to eq(@name)
        expect(@json[0]['state']).to eq(@state)
      end
    end
  end

  describe '#search_city_by_id' do
    it "should not return a error" do
      VCR.use_cassette('locale/search_city_by_id') do
        @json = JSON.parse(@locale.search_city_by_id(@id))
        expect {@json}.not_to raise_error
      end
    end

    it "should return a hash containing data to city by id" do
      VCR.use_cassette('locale/search_city_by_id') do
        @json = JSON.parse(@locale.search_city_by_id(@id))
        expect(@json['name']).to eq(@name)
      end
    end
  end
end
