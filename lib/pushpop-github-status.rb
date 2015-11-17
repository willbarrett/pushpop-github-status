require 'pushpop'
require 'multi_json'
require 'http'

module Pushpop

  class GithubStatus < Step

    PLUGIN_NAME = 'githubstatus'

    Pushpop::Job.register_plugin(GithubStatus::PLUGIN_NAME, GithubStatus)

    BASE_URL = "https://status.github.com/api"

    def run(last_response=nil, step_responses=nil)
      if last_response == nil
        last_response = [:status, :last_message, :messages, :daily_summary]
      end
      response = {}
      last_response.each do |endpoint|
        response[endpoint] = self.send(endpoint)
      end
      response
    end

    def status
      MultiJson.load(HTTP.get(BASE_URL + "/status.json").to_s)
    end

    def last_message
      MultiJson.load(HTTP.get(BASE_URL + "/last-message.json").to_s)
    end

    def messages
      MultiJson.load(HTTP.get(BASE_URL + "/messages.json").to_s)
    end

    def daily_summary
      MultiJson.load(HTTP.get(BASE_URL + "/daily-summary.json").to_s)
    end
  end

end
