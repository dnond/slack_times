require 'slack_times/version'
require 'slack'

module SlackTimes
  class Chat
    def initialize
      Slack.configure do |config|
        config.token = ENV['SLACK_TOKEN']
      end
    end

    def post(message)
      return 'no message!' if message.nil?
      return 'no channel!' if channel.nil?
      Slack.chat_postMessage post_options.merge(text: message, channel: channel)
    end

    private

    def channel
      ENV['SLACK_TIMES_CHANNEL']
    end

    def post_options
      # options doc: https://github.com/aki017/slack-ruby-gem/blob/dev/lib/slack/endpoint/chat.rb#L24
      { as_user: true }
    end
  end
end
