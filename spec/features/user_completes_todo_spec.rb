require "rails_helper"

feature "Todo is marked as completed" do
  scenario "successfully" do
    sign_in

    click_on "Add a new todo"
    fill_in 'Title', with: 'Learn RSpec'
    click_on "Submit"

    click_on "Mark complete"

    expect(page).to have_css ".todos li.completed", text: "Learn RSpec"
  end
end