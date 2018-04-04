module Pages
  module JobPostingForm
    def fill_in_form(title: nil, poster: nil, category: nil, location: nil, description: nil)
      fill_in("Title", with: title) if title
      select(poster, from: "Job poster") if poster
      select(category, from: "Category") if category
      select(location, from: "Location") if location
      fill_in("Description", with: description) if description
    end
  end
end
