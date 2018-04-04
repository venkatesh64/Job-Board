module Pages
  class JobPostingPage
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def view(posting)
      visit job_posting_path(posting)
    end

    def view_all_postings
      click_link "View All Job Postings"
    end

    def viewing_all_postings?
      page.has_current_path?(job_postings_path)
    end

    def has_details_for?(posting)
      contains_posting_fields?(JobPostingDecorator.new(posting))
    end

    private

    def contains_posting_fields?(posting)
      contains_posting_metadata?(posting) && contains_posting_attributes?(posting)
    end

    def contains_posting_metadata?(posting)
      contains_posting_date?(posting)
    end

    def contains_posting_attributes?(posting)
      contains_title?(posting) &&
        contains_poster?(posting) &&
        contains_category?(posting) &&
        contains_location?(posting) &&
        contains_status?(posting) &&
        contains_description?(posting)
    end

    def contains_posting_date?(posting)
      page.has_css?("dd.posting-date", text: posting.posted_at.strftime("%m/%d/%Y"))
    end

    def contains_title?(posting)
      page.has_css?("dd.posting-title", text: posting.title)
    end

    def contains_poster?(posting)
      page.has_css?("dd.posting-poster", text: posting.poster_name)
    end

    def contains_category?(posting)
      page.has_css?("dd.posting-category", text: posting.category_name)
    end

    def contains_location?(posting)
      page.has_css?("dd.posting-location", text: posting.location_full_address.tr("\n", " "))
    end

    def contains_status?(posting)
      page.has_css?("dd.posting-status", text: posting.status)
    end

    def contains_description?(posting)
      page.has_css?("dd.posting-description", text: posting.description)
    end
  end
end
