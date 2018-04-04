require Rails.root.join("spec", "support", "pages", "job_posting_form.rb")

module Pages
  class EditJobPostingPage
    include Capybara::DSL
    include Pages::JobPostingForm

    def submit
      click_button "Update Job"
    end

    def has_created_posting?(job_posting)
      job_posting_page.has_details_for?(job_posting)
    end

    def has_errors?
      page.has_css?("#error_explanation")
    end

    private

    def job_posting_page
      @job_posting_page ||= Pages::JobPostingPage.new
    end
  end
end
