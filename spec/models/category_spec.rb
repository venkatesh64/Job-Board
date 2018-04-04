require "rails_helper"

RSpec.describe Category, type: :model do
  subject(:category) { build :category }

  it { should have_many :job_postings }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
end
