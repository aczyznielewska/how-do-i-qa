require "rails_helper"

feature "Testing #4 page", js: true do
  scenario "#1 Check for some text to appear" do
    visit "/pages/test_4"
    expect(page).to have_content("Test #4")

   find(:xpath, ".//a[@id='test-4-ajax-btn']").click

    # within(:xpath, ".//p[@id='ajax-result']") do
    # expect(page).to have_content("This is answer from the server")
    # end
   expect(find(:xpath, ".//p[@id='ajax-result']")).to have_content("This is answer from the server")

  end
end

