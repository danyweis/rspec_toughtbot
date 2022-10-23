require 'rails_helper'

feature "User creates todo" do
  scenario "successfully" do
    # visit root_path
    sign_in

    click_on "Add a new todo"
    fill_in 'Title', with: 'Learn RSpec'
    click_on "Submit"

    expect(page).to have_css "li, .todos", text: "Learn RSpec"
    
  end
end