class JobPostingDecorator < Draper::Decorator
  delegate_all
  decorates_association :location

  delegate :city, to: :location, prefix: true
  delegate :full_address, to: :location, prefix: true

  def category_name
    category.name.titleize
  end

  def poster_name
    job_poster.full_name
  end

  def status
    object.status.titleize
  end
end
