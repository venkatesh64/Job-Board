class JobPosterSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :full_name
  )

  delegate :full_name, to: :object
end
