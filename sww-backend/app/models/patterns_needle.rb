# == Schema Information
#
# Table name: patterns_needles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  needle_id  :bigint           not null
#  pattern_id :bigint           not null
#
# Indexes
#
#  index_patterns_needles_on_needle_id   (needle_id)
#  index_patterns_needles_on_pattern_id  (pattern_id)
#
# Foreign Keys
#
#  fk_rails_...  (pattern_id => patterns.id)
#
class PatternsNeedle < ApplicationRecord
  belongs_to :pattern
  belongs_to :needle
end
