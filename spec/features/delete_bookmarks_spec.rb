feature 'delete' do
  scenario 'delete from bookmarks' do
    visit('/')
    click_button 'Delete'
    fill_in 'title', with: "Website"
    fill_in 'url', with: "wwww.iamwebsite.com"
    click_button 'Submit'
    visit('/')
    click_button 'Delete'
    expect(page).to_not have_content 'Website'
    expect(page).to have_content 'You have deleted Website'
  end
end
