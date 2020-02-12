require "rails_helper"

feature "Testing #5 page", js: true do

  before(:each) do
    @user = create(:user)
    allow_any_instance_of(PagesController).to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(PagesController).to receive(:current_user).and_return(@user)
  end
  scenario "#1 Check login screen" do
    visit "/pages/test_5"
    expect(page).to have_content(@user.email)
  end
end

