require "rails_helper"

feature "User sees own todos" do
  scenario "dosen't see other's todos" do
    Todo.create!(title: "Learn RSpec", email: "someone_else@example.com")

    sign_in_as "someone@example.com"

    expect(page).not_to have_css "li .todos", text: "Learn RSpec"
  end
end