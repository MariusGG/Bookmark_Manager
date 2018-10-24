require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers', 'www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('BBC', 'www.bbc.co.uk');")

    visit('/bookmarks')

    expect(page).to have_content 'Makers'
    expect(page).to have_content 'BBC'
    # expect(page).to have_content "Makers"
    # expect(page).to have_content "BBC"
  end

  # feature 'viewing bookmarks' do
  #   scenario 'bookmarks are visible' do
  #     Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
  #     Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
  #     Bookmark.create(url: 'http://www.google.com', title: 'Google')
  #
  #     visit '/bookmarks'
  #
  #     expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  #     expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
  #     expect(page).to have_link('Google', href: 'http://www.google.com')
  #     end
  #   end

end
