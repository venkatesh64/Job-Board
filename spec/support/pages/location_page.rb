module Pages
  class LocationPage
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def view(location)
      visit location_path(location)
    end

    def has_details_for?(location)
      contains_name?(location) && contains_address_information?(location)
    end

    private

    def contains_name?(location)
      page.has_css?("dd.location-name", text: location.name)
    end

    def contains_address_information?(location)
      contains_street_address_1?(location) &&
        contains_street_address_2?(location) &&
        contains_city?(location) &&
        contains_state?(location) &&
        contains_zip_code?(location)
    end

    def contains_street_address_1?(location)
      page.has_css?("dd.location-street-address-1", text: location.street_address_1)
    end

    def contains_street_address_2?(location)
      page.has_css?("dd.location-street-address-2", text: location.street_address_2)
    end

    def contains_city?(location)
      page.has_css?("dd.location-city", text: location.city)
    end

    def contains_state?(location)
      page.has_css?("dd.location-state", text: location.state)
    end

    def contains_zip_code?(location)
      page.has_css?("dd.location-zip-code", text: location.zip_code)
    end
  end
end
