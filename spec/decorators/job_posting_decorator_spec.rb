require "rails_helper"

RSpec.describe JobPostingDecorator do
  subject(:decorator) { JobPostingDecorator.decorate(job_posting) }
  let(:job_posting) { build :job_posting }

  it { should delegate_method(:full_address).to(:location).with_prefix }

  describe "#category_name" do
    let(:job_posting) { build :job_posting, category: category }
    let(:category) { build :category, name: "information technology" }

    its(:category_name) { should eq "Information Technology" }
  end

  describe "#location_city" do
    let(:job_posting) { build :job_posting, location: location }
    let(:location) { build :location, city: "New York" }

    its(:location_city) { should eq "New York" }
  end

  describe "#poster_name" do
    let(:job_posting) { build :job_posting, job_poster: poster }
    let(:poster) { build :job_poster, first_name: "Patrice", last_name: "Bergeron" }

    its(:poster_name) { should eq "Patrice Bergeron" }
  end

  describe "#status" do
    let(:job_posting) { build :job_posting, :new_post }

    its(:status) { should eq "New Post" }
  end
end
