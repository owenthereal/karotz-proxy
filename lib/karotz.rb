require 'rest-client'

module KarotzProxy
  class Karotz < Struct.new(:interactive_id)

    def tts(text)
      RestClient.get "http://api.karotz.com/api/karotz/tts?action=speak&lang=EN&text=#{text}&interactiveid=#{interactive_id}"
    end
  end
end
