require "rails_helper"

feature "Testing #6 page", js: true do
  let(:country) { $country = create(:country) }
  
  scenario "#1 Country does not exist in db" do
    visit "/pages/test_6"
    expect(page).to have_content("No data")
  end
   
  scenario "#2 Check country" do
    contentToFind = country.name + " | " + country.code

    visit "/pages/test_6"
    expect(page).to have_content(contentToFind)
  end

end

