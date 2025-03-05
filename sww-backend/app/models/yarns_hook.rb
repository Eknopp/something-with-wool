# == Schema Information
#
# Table name: yarns_hooks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hook_id    :bigint           not null
#  yarn_id    :bigint           not null
#
# Indexes
#
#  index_yarns_hooks_on_hook_id  (hook_id)
#  index_yarns_hooks_on_yarn_id  (yarn_id)
#
# Foreign Keys
#
#  fk_rails_...  (hook_id => hooks.id)
#  fk_rails_...  (yarn_id => yarns.id)
#
class YarnsHook < ApplicationRecord
  belongs_to :yarn
  belongs_to :hook
end
