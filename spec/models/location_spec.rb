require "rails_helper"

RSpec.describe Location, type: :model do
  it { should have_many :job_postings }

  it { should validate_presence_of :name }
  it { should validate_presence_of :street_address_1 }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip_code }
end
