module Pages
  class CreateLocationPage
    include Capybara::DSL

    def fill_in_form(address_fields = {}, name: nil)
      fill_in("Name", with: name) if name
      fill_in_address(address_fields)
    end

    def submit
      click_button "Add Location"
    end

    def has_created_location?(location)
      location_page.has_details_for?(location)
    end

    def has_errors?
      page.has_css?("#error_explanation")
    end

    private

    def location_page
      @location_page ||= Pages::LocationPage.new
    end

    def fill_in_address(street_address_1: nil, street_address_2: nil,
      city: nil, state: nil, zip_code: nil)
      fill_in("Street address 1", with: street_address_1) if street_address_1
      fill_in("Street address 2", with: street_address_2) if street_address_2
      fill_in("City", with: city) if city
      fill_in("State", with: state) if state
      fill_in("Zip code", with: zip_code) if zip_code
    end
  end
end
