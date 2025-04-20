# == Schema Information
#
# Table name: patterns
#
#  id                   :bigint           not null, primary key
#  archived_at          :datetime
#  craft_type           :string           not null
#  currency             :string
#  difficulty_rating    :integer
#  first_published_date :date             not null
#  gauge_pattern        :string
#  languages            :string           default(["en"]), is an Array
#  likes                :integer
#  name                 :string           not null
#  nbr_rows             :integer          not null
#  nbr_stitches         :integer          not null
#  notes                :string
#  overall_rating       :integer
#  overall_yarn_weight  :string           not null
#  pdf_path             :string           not null
#  pictures_path        :string           not null
#  price                :float
#  release_date         :date
#  repeats              :integer
#  sizes                :string           default([]), is an Array
#  swatch_size          :integer          not null
#  total_yardage        :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_patterns_on_craft_type  (craft_type)
#  index_patterns_on_name        (name)
#  index_patterns_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class PatternSerializer
  include JSONAPI::Serializer

  attributes :id, :craft_type, :currency, :difficulty_rating, :first_published_date, :gauge_pattern,
    :languages, :likes, :name, :nbr_rows, :nbr_stitches, :notes, :overall_rating, :overall_yarn_weight,
    :pdf_path, :pictures_path, :price, :release_date, :repeats, :sizes, :swatch_size, :total_yardage,
    :created_at, :updated_at, :user_id, :archived_at

  has_many :yarns, serializer: YarnSerializer
end
