module KarotzProxy
  class KarotzMapper
    attr_reader :db

    def initialize(db)
      @db = db
    end

    def save(karotz)
      db.save("karotzs", Yajl.dump(Hash[karotz.each_pair.to_a]))
    end

    def all
      db.all("karotzs").collect { |json| create_karotz_from_hash(Yajl.load(json)) }
    end

    private

    def create_karotz_from_hash(hash)
      Karotz.new.tap do |karotz|
        hash.each_pair do |key, value|
          karotz.send("#{key}=", value)
        end
      end
    end
  end
end
