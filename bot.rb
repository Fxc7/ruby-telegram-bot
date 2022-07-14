require('telegram/bot')

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
  end
end

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    command(bot, message)
  end
end
