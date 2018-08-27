RSpec.describe Advisor do
  it "has a version number" do
    VCR.use_cassette("synopsis") do
      expect(Advisor::VERSION).not_to be nil
    end
  end
end
