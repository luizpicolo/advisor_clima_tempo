RSpec.describe Advisor::V1::History do
  before do
    @history = Advisor::V1::History.new(File.read('token'))
    @from = '2017-10-01'
    @to = '2017-10-06'
    @id = '9091'
  end

  describe '#historic' do
    it "should not return a error" do
      VCR.use_cassette('historic/api') do
        @json = JSON.parse(@history.historic(@id, @from, @to))
        expect {@json}.not_to raise_error
      end
    end

    it "should return a hash containing data to city" do
      VCR.use_cassette('historic/api') do
        @json = JSON.parse(@history.historic(@id, @from, @to))
        expect(@json['name']).to eq(@name)
        expect(@json['state']).to eq(@state)
      end
    end
  end
end
