require('telegram/bot')
require_relative('lib/command/nekonime')

token = 'YOUR_TOKEN_HERE'

def command(bot, message)
  id = message.chat.id

  client = bot.api

  case message.text
  when '/start'
    client.send_message(
      chat_id: id,
      text: "Hello, #{message.from.first_name}"
    )
  when '/stop'
    client.send_message(
      chat_id: id,
      text: "Bye, #{message.from.first_name}"
    )
  when '/nekonime'
    neko = Neko.new.display_neko
    client.send_photo(
      chat_id: id,
      photo: neko
    )
  end
end

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    command(bot, message)
  end
end
