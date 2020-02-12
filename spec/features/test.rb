# You can remove this file, it is just added here to show you the structure of specs.

# This 'require' imports whole config from spec/rails_helper.rb file and rspec/capybara methods
require 'rails_helper'

# 'feature' is the basic block in spec where you describe the tested feature. There should be only one 'feature' block in one file/spec.
# Use js: true to switch to the Capybara.javascript_driver and to see your specs running on real Chrome browser with interface.
feature 'It is just test', js: true do

# 'context' is not required part of spec, but it helps organizing scenarios. you can have as many contexts in one spec as you need.
  context 'with context' do
    # 'scenario' describes one scenario (lol) of the feature, e.g. 'login with valid credentials' or 'login with invalid password'
    scenario 'does something' do
      visit '/'
    end
  end

  # And here is the scenario outside the context block/
  scenario 'without context' do
    visit '/'
  end
end
