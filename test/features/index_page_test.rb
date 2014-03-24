require "test_helper"

feature "IndexPage" do
  scenario "View posts on root path" do
    visit root_path
    page.must_have_content posts(:published).title
    page.must_have_content posts(:published).body
    page.wont_have_content posts(:unpublished).title
    page.wont_have_content posts(:unpublished).body
  end
end
