# TelegramSimpleMessenger

It's a simple gem to send messages through Telegram to a user or a group/channel.

## What do you need?

To use it, you need and Telegram API KEY (a bot key) and a Chat ID.

### API KEY
The API KEY you can get building a new bot through [@BotFather](https://t.me/botfather). Just send a Telegram message to [@BotFather](https://t.me/botfather) and follows the instructions. An API KEY looks like this: `5490951233:AAFZH99VRQuIOH-qweL1fwATf3kna2eBQSE`.

### CHAT ID
Use another Telegram Bot [@RawDataBot](https://t.me/raw_data_bot) to find your own Chat ID or a group/channel Chat ID.

## Installation

Add to your `Gemfile`

```ruby
gem "telegram_simple_messenger", github: "shayani/telegram_simple_messenger"
```

Then run

```sh
bundle install
```

## Configuration

Create a initializer file to set the default API KEY and CHAT ID

```ruby
# config/initializers/telegram_simple_messenger.rb

TelegramSimpleMessenger.defautl_api_key=MY_API_KEY
TelegramSimpleMessenger.default_chat_id=MY_CHAT_ID
```

## Usage

### Sending a message using the default API KEY and CHAT ID

Simple call the service:

```ruby
TelegramSimpleMessenger.send_message("Hello world!")
```

### Overwriting the API KEY and/or CHAT ID

You can overwrite the default API KEY and CHAT ID passing them as arguments:

```ruby
TelegramSimpleMessenger.send_message("Hello world!", ANOTHER_API_KEY, ANOTHER_CHAT_ID)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/telegram_simple_messenger.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
