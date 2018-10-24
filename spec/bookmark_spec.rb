require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Makers', 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('BBC', 'http://www.bbc.co.uk');")

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 2
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.title).to eq 'Makers'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end
end
