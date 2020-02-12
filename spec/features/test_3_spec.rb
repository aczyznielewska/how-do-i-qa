require "rails_helper"

feature "Testing #3 page", js: true do
  scenario "#1 Check the highlighted row - first one" do
    visit "/pages/test_3"
    expect(page).to have_content("Test #3")
    first(:xpath, "//table//tr").click
    expect(page).to have_css("tr:first-of-type.highlighted")
  end

  scenario "#2 Check the highlighted row - last one" do
    visit "/pages/test_3"
    all("table tr").last.click
    expect(page).to have_css("tr:last-of-type.highlighted")
  end
end
