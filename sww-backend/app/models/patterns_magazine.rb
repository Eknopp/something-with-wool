# == Schema Information
#
# Table name: patterns_magazines
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  magazine_id :bigint           not null
#  pattern_id  :bigint           not null
#
# Indexes
#
#  index_patterns_magazines_on_magazine_id  (magazine_id)
#  index_patterns_magazines_on_pattern_id   (pattern_id)
#
# Foreign Keys
#
#  fk_rails_...  (magazine_id => magazines.id)
#  fk_rails_...  (pattern_id => patterns.id)
#
class PatternsMagazine < ApplicationRecord
  belongs_to :pattern
  belongs_to :magazine
end
