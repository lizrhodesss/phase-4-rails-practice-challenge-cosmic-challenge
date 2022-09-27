class ScientistMissionSerializer < ActiveModel::Serializer
  attributes :name, :field_of_study, :avatar

  has_many :planets
end
