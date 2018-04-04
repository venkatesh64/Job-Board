require "rails_helper"

RSpec.feature "Viewing a particular location", type: :system do
  scenario "Accessibility", js: true do
    location = create :location

    visit location_path(location)

    expect(page).to be_accessible
  end

  scenario "Viewing the details of a location" do
    location = create :location

    location_page = Pages::LocationPage.new
    location_page.view location

    expect(location_page).to have_details_for location
  end
end
