class CategorySerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name
  )

  def name
    object.name.titleize
  end
end
