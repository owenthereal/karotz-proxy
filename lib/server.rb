require 'rest-client'
require 'uri'

$interactive_ids = Set.new

get '/callback' do
  logger.info(params.inspect)
  $interactive_ids << params['interactiveid']

  "OK"
end

post '/tts' do
  logger.info(params.inspect)
  speech = URI.encode(params['text'])
  $interactive_ids.map do |id|
    RestClient.get "http://api.karotz.com/api/karotz/tts?action=speak&lang=EN&text=#{speech}&interactiveid=#{id}"
  end.inspect
end
