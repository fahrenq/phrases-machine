require 'rails_helper'

feature "Phrases index" do
  before do
    Capybara.current_driver = :webkit

    @first = Phrase.create(id: 1, text: "First phrase")
    @second = Phrase.create(id: 2, text: "Second phrase")
    @third = Phrase.create(id: 3, text: "Third phrase")
  end

  scenario "visit index" do
    visit root_path

    expect(page).to have_css "p", text: ""
    expect(page).to have_css "button", text: "Get a random phrase"

    # Note:
    # Button doesn't call js properly
    click_button("Get a random phrase")
    expect(page).to have_css "p", text: "remaining"
    click_button("Get a random phrase")
    expect(page).to have_css "p", text: "remaining"
    click_button("Get a random phrase")
    expect(page).to have_css "p", text: "remaining"
    click_button("Get a random phrase")
    expect(page).to have_css "p", text: "There is no more phrases. Sorry"
  end
end
