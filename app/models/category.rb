class Category < ApplicationRecord
  has_many :job_postings, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
