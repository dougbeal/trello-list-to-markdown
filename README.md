require 'trello'

Trello.configure do |config|
  #   #https://trello.com/app-key
  config.developer_public_key = "TODO: https://trello.com/app-key"
  # https://trello.com/1/authorize?expiration=never&name=SinglePurposeToken&key=REPLACEWITHYOURKEY
  config.member_token = "https://trello.com/1/authorize?expiration=never&name=SinglePurposeToken&key=REPLACEWITHYOURKEY"
end
