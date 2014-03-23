require "test_helper"

feature "IndexPage" do
  scenario "View posts on root path" do
    visit root_path
    page.must_have_content posts(:one).title
    page.must_have_content posts(:one).body
  end
end
