require "rails_helper"

RSpec.describe JobPoster, type: :model do
  it { should have_many :job_postings }

  describe "#full_name" do
    context "with no name attributes" do
      subject(:poster) { build :job_poster, first_name: nil, last_name: nil }

      its(:full_name) { should be_empty }
    end

    context "with only a first name" do
      subject(:poster) { build :job_poster, first_name: "Patrice", last_name: nil }

      its(:full_name) { should eq "Patrice" }
    end

    context "with only a last name" do
      subject(:poster) { build :job_poster, first_name: nil, last_name: "Bergeron" }

      its(:full_name) { should eq "Bergeron" }
    end

    context "with both a first and last name" do
      subject(:poster) { build :job_poster, first_name: "Patrice", last_name: "Bergeron" }

      its(:full_name) { should eq "Patrice Bergeron" }
    end
  end
end
