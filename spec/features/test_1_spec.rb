require 'rails_helper'

feature 'Testing #1 page', js: true do
  scenario 'Check if clicking the "Next" button within specific scope leads to next page' do
    visit '/pages/test_1'
    expect(page).to have_content('Test #1')
    
    within(:xpath, ".//div[@id='footer']") do
      click_link('Next')
    end
    expect(page).to have_content('Test #2')
  end
end
