
set :environment, KAROTZ_PROXY_ENV
set :karotz_mapper, KarotzProxy.karotz_mapper

enable :logging, :dump_errors, :raise_errors

get '/callback' do
  logger.info(params.inspect)
  karotz = KarotzProxy::Karotz.new(params["interactiveid"], params["installid"])
  if settings.karotz_mapper.save(karotz)
    "OK"
  else
    karotz.errors.inspect
  end
end

post '/callback' do
  logger.info(params.inspect)
end

get '/karotzs' do
  settings.karotz_mapper.all.inspect
end

get '/karotzs/destroy' do
  settings.karotz_mapper.destroy_all
end

post '/karotzs/tts' do
  logger.info(params.inspect)
  text = URI.encode(params['text'])
  settings.karotz_mapper.all.map do |karotz|
    karotz.tts(text)
  end.inspect
end

not_found do
  logger.error("#{request.request_method} #{request.path} not found")
end

error do
  logger.error("Error occurred: #{caller}")
end
