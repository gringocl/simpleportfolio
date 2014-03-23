require "test_helper"

feature "ContactFormMailer" do
  scenario "Send email from contact form" do
    visit contact_path
    fill_in "Name", with: "Someone"
    fill_in "Email", with: "someone@example.com"
    fill_in "Subject", with: "Test from someone"
    fill_in "Message", with: "Hello from Someone"

    click_link_or_button "Contact Me!"

    assert ActionMailer::Base.deliveries.last.to == ['milesstarkenburg@gmail.com']
  end

  scenario "Doesnt send email with out valid fields" do
    visit contact_path

    fill_in "Email", with: "someone@example.com"

    click_link_or_button "Contact Me!"
    
    page.must_have_content "Please fill in all fields."
  end
end
