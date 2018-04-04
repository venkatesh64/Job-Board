require "rails_helper"

RSpec.describe "Creating a job posting", type: :system do
  scenario "Accessibility", js: true do
    visit new_job_posting_path

    expect(page).to be_accessible
  end

  scenario "Creating a valid job posting" do
    job_poster = create :job_poster, first_name: "Patrice", last_name: "Bergeron"
    category = create :category, name: "Software Development"
    location = create :location, city: "Cambridge"
    job_posting = build :job_posting, title: "Architect", description: "A great place to work!"

    visit job_postings_path
    click_link "Add New Job"

    create_page = Pages::CreateJobPostingPage.new

    create_page.fill_in_form(
      title: job_posting.title,
      poster: job_poster.full_name,
      category: category.name,
      location: location.name,
      description: job_posting.description
    )
    create_page.submit

    submitted_job = JobPosting.find_by(
      title: job_posting.title,
      job_poster: job_poster,
      category: category,
      location: location,
      description: job_posting.description
    )

    expect(create_page).to have_created_posting submitted_job
  end

  scenario "Creating an invalid job posting" do
    create :job_poster, first_name: "Patrice", last_name: "Bergeron"
    create :category, name: "Software Development"
    create :location, city: "Cambridge"

    visit new_job_posting_path

    create_page = Pages::CreateJobPostingPage.new

    expect(create_page).not_to have_errors

    create_page.submit
    expect(create_page).to have_errors
  end
end
