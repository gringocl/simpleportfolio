require "test_helper"

feature "Posts" do
  scenario "Authenticated user can create posts" do
    signin_user

    click_link_or_button "New Post"

    fill_in "Title", with: "New Post"
    fill_in "Body", with: "Some text"

    click_link_or_button "Create Post"

    page.must_have_content "New Post"
    page.must_have_content "Unpublished"
  end

  scenario "Authenticated user can publish posts" do
    signin_user

    click_link_or_button posts(:unpublished).title
    page.must_have_content "Unpublished"
    click_link_or_button "Publish"

    page.must_have_content "Published"

  end
end
