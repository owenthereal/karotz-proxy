require 'database'
require 'karotz'
require 'karotz_mapper'

set :environment, KAROTZ_PROXY_ENV
set :mapper, KarotzProxy::KarotzMapper.new(KarotzProxy::Database.new(ENV["REDISTOGO_URL"]))

enable :logging, :dump_errors, :raise_errors

get '/callback' do
  logger.info(params.inspect)
  karotz = KarotzProxy::Karotz.new(params["interactiveid"])
  if settings.mapper.save(karotz)
    "OK"
  else
    karotz.errors.inspect
  end
end

post '/callback' do
  logger.info(params.inspect)
end

get '/karotzs' do
  settings.mapper.all.inspect
end

post '/karotzs/tts' do
  logger.info(params.inspect)
  text = URI.encode(params['text'])
  settings.mapper.all.map do |karotz|
    karotz.tts(text)
  end.inspect
end

not_found do
  logger.error("#{request.request_method} #{request.path} not found")
end

error do
  logger.error("Error occurred: #{caller}")
end
