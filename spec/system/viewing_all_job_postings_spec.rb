require "rails_helper"

RSpec.feature "Viewing all job postings", type: :system do
  scenario "Accessibility", js: true do
    create_list :job_posting, 3

    visit job_postings_path

    expect(page).to be_accessible
  end

  scenario "Viewing a posting on the page" do
    posting = create :job_posting

    postings_page = Pages::JobPostingsPage.new
    visit job_postings_path

    expect(postings_page).to have_job_posting posting

    postings_page.view posting

    expect(postings_page).to be_viewing_posting posting
  end
end
