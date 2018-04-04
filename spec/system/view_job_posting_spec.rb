require "rails_helper"

RSpec.feature "Viewing a particular job posting", type: :system do
  scenario "Accessibility", js: true do
    posting = create :job_posting

    visit job_posting_path(posting)

    expect(page).to be_accessible
  end

  scenario "Viewing the details of the posting" do
    posting = create :job_posting

    posting_page = Pages::JobPostingPage.new
    posting_page.view posting

    expect(posting_page).to have_details_for posting
  end

  scenario "Navigating to all postings" do
    posting = create :job_posting

    posting_page = Pages::JobPostingPage.new
    posting_page.view posting

    posting_page.view_all_postings

    expect(posting_page).to be_viewing_all_postings
  end
end
