# == Schema Information
#
# Table name: patterns_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  pattern_id  :bigint           not null
#
# Indexes
#
#  index_patterns_categories_on_category_id  (category_id)
#  index_patterns_categories_on_pattern_id   (pattern_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (pattern_id => patterns.id)
#
require "test_helper"

class PatternsCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
