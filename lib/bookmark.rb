require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connected = PG.connect(dbname: 'bookmark_manager_test')
    else
      connected = PG.connect(dbname: 'bookmark_manager')
    end
    list_results = connected.exec('SELECT * FROM bookmarks')
    list_results.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(title:, url:)
    # return false unless is_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      connected = PG.connect(dbname: 'bookmark_manager_test')
    else
      connected = PG.connect(dbname: 'bookmark_manager')
    end
    connected.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}');")
    #Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0][url])
  end

end
