require 'spec_helper'

describe Pushpop::GithubStatus do

  describe '#run' do
    it "should load all endpoints if none are specified" do
      step = Pushpop::GithubStatus.new
      resp = step.run
      expect(resp[:status]).to_not be_nil
      expect(resp[:last_message]).to_not be_nil
      expect(resp[:messages]).to_not be_nil
      expect(resp[:daily_summary]).to_not be_nil
    end

    it "should load only the endpoints specified" do
      step = Pushpop::GithubStatus.new
      resp = step.run([:status, :last_message])
      expect(resp[:status]).to_not be_nil
      expect(resp[:last_message]).to_not be_nil
      expect(resp[:messages]).to be_nil
      expect(resp[:daily_summary]).to be_nil
    end
  end
end
