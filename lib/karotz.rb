require 'rest-client'

module KarotzProxy
  class Karotz < Struct.new(:interactive_id, :install_id)
    attr_reader :errors

    alias_method :identifier, :install_id

    def initialize(*args)
      super
      @errors = {}
    end

    def valid?
      validate
      errors.empty?
    end

    def validate
      errors.clear
      errors[:interactive_id] = "Interactive ID can't be nil" if interactive_id.nil?
      errors[:install_id] = "Install ID can't be nil" if install_id.nil?
    end

    def tts(text)
      RestClient.get "http://api.karotz.com/api/karotz/tts?action=speak&lang=EN&text=#{text}&interactiveid=#{interactive_id}"
    end
  end
end
