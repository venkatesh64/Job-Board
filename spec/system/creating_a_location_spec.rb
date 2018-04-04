require "rails_helper"

RSpec.describe "Creating a location", type: :system do
  scenario "Accessibility", js: true do
    visit new_location_path

    expect(page).to be_accessible
  end

  scenario "Creating a valid location" do
    location = build :location,
      name: "TD Garden",
      street_address_1: "100 Legends Way",
      street_address_2: "Suite 4",
      city: "Boston",
      state: "MA",
      zip_code: "02114"

    visit job_postings_path
    click_link "Add New Location"

    create_page = Pages::CreateLocationPage.new

    create_page.fill_in_form(
      {
        street_address_1: location.street_address_1,
        street_address_2: location.street_address_2,
        city: location.city,
        state: location.state,
        zip_code: location.zip_code
      },
      name: location.name
    )
    create_page.submit

    submitted_location = Location.find_by(
      name: location.name,
      street_address_1: location.street_address_1,
      street_address_2: location.street_address_2,
      city: location.city,
      state: location.state,
      zip_code: location.zip_code
    )

    expect(create_page).to have_created_location submitted_location
  end

  scenario "Creating an invalid location" do
    visit new_location_path

    create_page = Pages::CreateLocationPage.new

    expect(create_page).not_to have_errors

    create_page.submit
    expect(create_page).to have_errors
  end
end
