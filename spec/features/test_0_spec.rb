require "rails_helper"

feature "Testing #0 page", js: true do
  scenario 'Check if clicking the "Next" button leads to next page' do
    visit "/pages/test_0"
    expect(page).to have_content("Test #0")
    click_link("Next")
    expect(page).to have_content("Test #1")
  end
end
