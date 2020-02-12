require "rails_helper"

feature "Testing #2 page", js: true do
  scenario "#1 Fill put the form and check submitted data" do
    visit "/pages/test_2"
    expect(page).to have_content("Test #2")
    within(:xpath, ".//div[@id='test']/form") do
      fill_in("Example textfield", with: "Test Agaty")
      check("Example checkbox")
      select("Opt 2", from: "Example select")
      choose("Example radiobutton opt 2")
      click_button("Submit")
    end
    within(:xpath, ".//div[@id='test']/ul[3]") do
      expect(find(:xpath, ".//li[1]")).to have_content("Test Agaty")
      expect(find(:xpath, ".//li[2]")).to have_content("Checkbox checked: 1")
      expect(find(:xpath, ".//li[3]")).to have_content("Opt 2")
      expect(find(:xpath, ".//li[4]")).to have_content("opt 2")
    end
  end

  scenario "#2 Check success message" do
    visit "/pages/test_2"
    expect(page).to have_content("Test #2")
    within(:xpath, ".//div[@id='test']/form") do
      fill_in("Example textfield", with: "Test Agaty 2")
      check("Example checkbox")
      select("Opt 2", from: "Example select")
      choose("Example radiobutton opt 2")
      click_button("Submit")
    end
    expect(page).to have_content("Submitted successfully")
  end

  scenario "#3 Check error message - input field" do
    visit "/pages/test_2"
    expect(page).to have_content("Test #2")
    within(:xpath, ".//div[@id='test']/form") do
      check("Example checkbox")
      select("Opt 2", from: "Example select")
      choose("Example radiobutton opt 2")
      click_button("Submit")
    end
    expect(page).to have_content("Some data was missing")
  end

  scenario "#4 Check error message - checkbox" do
    visit "/pages/test_2"
    expect(page).to have_content("Test #2")
    within(:xpath, ".//div[@id='test']/form") do
      fill_in("Example textfield", with: "Test Agaty 4")
      select("Opt 2", from: "Example select")
      choose("Example radiobutton opt 2")
      click_button("Submit")
    end
    expect(page).to have_content("Some data was missing")
  end

  scenario "#5 Check error message - select" do
    visit "/pages/test_2"
    expect(page).to have_content("Test #2")
    within(:xpath, ".//div[@id='test']/form") do
      fill_in("Example textfield", with: "Test Agaty 2")
      check("Example checkbox")
      choose("Example radiobutton opt 2")
      click_button("Submit")
    end
    expect(page).to have_selector(:xpath, "./html/body/div/div/div[1]/div/div/div")
  end

  scenario "#6 Check error message - radiobutton" do
    visit "/pages/test_2"
    expect(page).to have_content("Test #2")
    within(:xpath, ".//div[@id='test']/form") do
      fill_in("Example textfield", with: "Test Agaty 2")
      check("Example checkbox")
      select("Opt 2", from: "Example select")
      click_button("Submit")
    end
    expect(find(:xpath, ".//html/body/div/div/div[1]/div/div/div/div")).to have_content("Some data was missing")
  end

  scenario "#7 Check message without submitting data" do
    visit "/pages/test_2"
    expect(page).to have_content("Test #2")
    expect(find('div#test > p:last-child')).to have_content("Data will appear here after submission.")
    # expect(find(:xpath, ".//div[@id='test']//p[6]")).to have_content("Data will appear here after submission.")
  end
end
