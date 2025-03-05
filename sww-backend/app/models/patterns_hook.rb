# == Schema Information
#
# Table name: patterns_hooks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hook_id    :bigint           not null
#  pattern_id :bigint           not null
#
# Indexes
#
#  index_patterns_hooks_on_hook_id     (hook_id)
#  index_patterns_hooks_on_pattern_id  (pattern_id)
#
# Foreign Keys
#
#  fk_rails_...  (hook_id => hooks.id)
#  fk_rails_...  (pattern_id => patterns.id)
#
class PatternsHook < ApplicationRecord
  belongs_to :pattern
  belongs_to :hook
end
