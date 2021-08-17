class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :current

  has_many :recordings

end
