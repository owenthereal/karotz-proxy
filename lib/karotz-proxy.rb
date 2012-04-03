require 'database'
require 'karotz'
require 'karotz_mapper'

module KarotzProxy
  def self.database
    @database ||= KarotzProxy::Database.new(ENV["REDISTOGO_URL"])
  end

  def self.karotz_mapper
    @karotz_mapper ||= KarotzProxy::KarotzMapper.new(KarotzProxy.database)
  end
end
