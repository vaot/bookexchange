module FastTagging
  class Books

    def initialize(book)
      @book = book
    end

    def add(tags)
      self.class.redis.multi do
        tags.each do |tag|
          self.class.redis.sadd(tag, @book.id)
        end
      end
    end

    def remove(tags)
      self.class.redis.multi do
        tags.each do |tag|
          self.class.redis.sadd(tag, @book.id)
        end
      end
    end

    def self.retrieve(tags)
      if tags.count > 1
        redis.sinter(*tags)
      else
        redis.smembers(tags.first)
      end
    end


    private

    def self.redis
      Bookexchange.redis
    end
  end
end
