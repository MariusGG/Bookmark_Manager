
feature 'Add bookmark' do
  scenario 'user fills in new bookmark and clicks add' do
  visit('/')
  click_button 'Add'
  fill_in 'title', with: "Website"
  fill_in 'url', with: "wwww.iamwebsite.com"
  click_button 'Submit'
  expect(page).to have_content "Website"
  end
end
