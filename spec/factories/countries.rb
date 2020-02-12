FactoryBot.define do
  factory :country, class: "SomeModule::Country" do
    name { "Great Britain" }
    code { "GB" }
  end
end
