# == Schema Information
#
# Table name: patterns_yarns
#
#  id         :bigint           not null, primary key
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
require "test_helper"

class PatternsYarnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
