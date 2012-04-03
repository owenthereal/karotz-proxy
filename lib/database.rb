require 'redis'
require 'yajl'

module KarotzProxy
  class Database
    attr_reader :redis

    def initialize(url)
      uri = URI.parse(url)
      @redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    end

    def save(model_name, identifier, attributes_hash)
      redis.hset(model_name, identifier, attributes_hash)
    end

    def all(model_name)
      redis.hgetall(model_name)
    end

    def destroy_all(model_name)
      redis.smembers(model_name).each do |key|
        redis.srem(model_name, key)
      end
    end
  end
end
