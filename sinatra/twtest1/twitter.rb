
# https://qiita.com/flmil/items/b804ae13de5b0e7e1b3

class TwitterSet
 def initialize(config)
  @config = config
  @rest = Twitter::REST::Client.new(@config)
  @stream = Twitter::Streaming::Client.new(@config)
 end
 private
end

CONFIG = { #TwitterTokenKey
 consumer_key:		ENV.fetch("CONSUMER_KEY"),
 consumer_secret:	ENV.fetch("CONSUMER_SECRET"),
 access_token:		ENV.fetch("ACCESS_TOKEN"),
 access_token_secret:	ENV.fetch("ACCESS_TOKEN_SECRET")
}

app = TwitterSettings.new(CONFIG)





