# == Schema Information
#
# Table name: patterns_yarns
#
#  id         :bigint           not null, primary key
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pattern_id :bigint           not null
#  yarn_id    :bigint           not null
#
# Indexes
#
#  index_patterns_yarns_on_pattern_id  (pattern_id)
#  index_patterns_yarns_on_yarn_id     (yarn_id)
#
# Foreign Keys
#
#  fk_rails_...  (pattern_id => patterns.id)
#  fk_rails_...  (yarn_id => yarns.id)
#
class PatternsYarn < ApplicationRecord
  belongs_to :pattern
  belongs_to :yarn

  validate :color_must_be_in_yarn_colors

  private

  def color_must_be_in_yarn_colors
    return if yarn.colors.include?(color)

    errors.add(:color, "must be one of the yarn's available colors, but the color '#{color}' does not exist for yarn of id #{yarn.id}")
    raise ActiveRecord::RecordInvalid.new(self)
  end
end
