module Pages
  class JobPostingsPage
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def view(posting)
      within(".job-posting-#{posting.id}") do
        click_link "View"
      end
    end

    def has_job_posting?(posting)
      within(".job-posting-#{posting.id}") do
        contains_posting_fields?(JobPostingDecorator.new(posting))
      end
    end

    def viewing_posting?(posting)
      page.has_current_path?(job_posting_path(posting))
    end

    private

    def contains_posting_fields?(posting)
      contains_posting_date?(posting) &&
        contains_title?(posting) &&
        contains_poster?(posting) &&
        contains_category?(posting) &&
        contains_location?(posting) &&
        contains_status?(posting)
    end

    def contains_posting_date?(posting)
      page.has_css?("td.posting-date", text: posting.posted_at.strftime("%m/%d/%Y"))
    end

    def contains_title?(posting)
      page.has_css?("td.posting-title", text: posting.title)
    end

    def contains_poster?(posting)
      page.has_css?("td.posting-poster", text: posting.poster_name)
    end

    def contains_category?(posting)
      page.has_css?("td.posting-category", text: posting.category_name)
    end

    def contains_location?(posting)
      page.has_css?("td.posting-location", text: posting.location_city)
    end

    def contains_status?(posting)
      page.has_css?("td.posting-status", text: posting.status)
    end
  end
end
