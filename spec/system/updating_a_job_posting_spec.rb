require "rails_helper"

RSpec.describe "Updating a job posting", type: :system do
  scenario "Accessibility", js: true do
    job_posting = create :job_posting

    visit edit_job_posting_path job_posting

    expect(page).to be_accessible
  end

  scenario "Updating a job posting" do
    job_posting = create :job_posting

    other_category = create :category, name: "Different Category"

    visit job_posting_path job_posting
    click_link "Edit Job"

    edit_page = Pages::EditJobPostingPage.new
    edit_page.fill_in_form(category: other_category.name)
    edit_page.submit

    updated_job_posting = job_posting.tap { |j| j.assign_attributes(category: other_category) }
    expect(edit_page).to have_created_posting updated_job_posting
  end

  scenario "Updating a job posting to an invalid state" do
    job_posting = create :job_posting

    visit edit_job_posting_path job_posting

    edit_page = Pages::EditJobPostingPage.new
    edit_page.fill_in_form(title: "")
    edit_page.submit

    expect(edit_page).to have_errors
  end
end
