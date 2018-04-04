class JobPostingSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :status,
    :description,
    :posted_at
  )

  has_one :category
  has_one :location
  has_one :job_poster

  def status
    object.status.titleize
  end
end
