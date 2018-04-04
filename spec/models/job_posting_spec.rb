require "rails_helper"

RSpec.describe JobPosting, type: :model do
  include ActiveSupport::Testing::TimeHelpers

  it { should belong_to :job_poster }
  it { should belong_to :category }
  it { should belong_to :location }

  it { should define_enum_for(:status).with([:new_post, :pending, :complete]) }

  it { should validate_presence_of :title }

  describe "defaults" do
    subject(:posting) { build :job_posting }
    let(:posted_time) { Time.zone.local(2017, 4, 21, 4, 44) }

    before { travel_to(posted_time) }

    after { travel_back }

    its(:posted_at) { should eq posted_time }

    its(:status) { should eq "new_post" }
  end
end
