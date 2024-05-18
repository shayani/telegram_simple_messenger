# frozen_string_literal: true

require_relative "telegram_simple_messenger/version"
require "httparty"

# Send a message to a Telegram chat with a single line of code.
#
# You can set a default API key and chat ID:
#   TelegramSimpleMessenger.default_api = "123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11"
#   TelegramSimpleMessenger.default_chat_id = "123456789"
#
# Example:
#   TelegramSimpleMessenger.send_message("Hello, world!")
#
# You can also pass the API key and chat ID as arguments:
#   TelegramSimpleMessenger.send_message("Hello, world!", "123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11", "123456789")
module TelegramSimpleMessenger
  class Error < StandardError; end

  class << self
    attr_accessor :default_api_key, :default_chat_id
  end

  self.default_api_key = nil
  self.default_chat_id = nil

  def self.send_message(message, api_key = default_api_key, chat_id = default_chat_id)
    raise Error, "No API key provided" unless api_key
    raise Error, "No chat ID provided" unless chat_id

    response = HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage",
                             body: {
                               chat_id: chat_id,
                               text: message
                             })

    raise Error, "Failed to send message: #{response.body}" unless response.success?

    response
  end
end
