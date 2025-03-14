class PatternSerializer
  include JSONAPI::Serializer
  attributes :id, :craft_type, :currency, :difficulty_rating, :first_published_date, :gauge_pattern,
    :languages, :likes, :name, :nbr_rows, :nbr_stitches, :notes, :overall_rating, :overall_yarn_weight,
    :pdf_path, :pictures_path, :price, :release_date, :repeats, :sizes, :swatch_size, :total_yardage,
    :created_at, :updated_at, :user_id
end
