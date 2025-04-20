class PatternListSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :craft_type, :difficulty_rating, :price, :release_date, :overall_rating, :currency

  attribute :is_archived do |object|
    object.archived_at.present?
  end
end
