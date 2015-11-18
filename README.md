# Pushpop-Github-Status

This is a step for [pushpop](https://github.com/pushpop-project/pushpop) that pulls Github's current status. It will pull all 4 status endpoints by default:

```ruby
require "pushpop"
require "pushpop-github-status"

job "Github status job" do
  every 5.minutes

  github_status

  step "do something with the status" do |gs|
    gs.status
  end
end
```

The format of the step's return value is:

```ruby
{
  # Format like https://status.github.com/api/status.json
  status: { },

  # Format like https://status.github.com/api/last-message.json
  last_message: { },

  # Format like https://status.github.com/api/messages.json
  messages: { },

  # Format like https://status.github.com/api/daily-summary.json
  daily_summary: { }
}
```

For an explanation of the values, check out Github's [status API documentation](https://status.github.com/api)


If you want to pull just a few of the endpoints, end the previous step with an array of the data you want:


```ruby
require "pushpop"
require "pushpop-github-status"

job "Github status job" do
  every 5.minutes

  step "set the endpoints I want" do
    [:status, :last_message]
  end

  github_status

  step "do something with the status" do |gs|
    gs.status
  end
end
```

The above code will only return the "status" and "last_message" endpoints.
