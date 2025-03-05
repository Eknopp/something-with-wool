# == Schema Information
#
# Table name: patterns_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pattern_id :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_patterns_tags_on_pattern_id  (pattern_id)
#  index_patterns_tags_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (pattern_id => patterns.id)
#  fk_rails_...  (tag_id => tags.id)
#
class PatternsTag < ApplicationRecord
  belongs_to :pattern
  belongs_to :tag
end
