require 'redis'
require 'yajl'

module KarotzProxy
  class Database
    attr_reader :redis

    def initialize(url)
      uri = URI.parse(url)
      @redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    end

    def save(model_name, attributes_hash)
      redis.sadd(model_name, attributes_hash)
    end

    def all(model_name)
      redis.smembers(model_name)
    end
  end
end
