# == Schema Information
#
# Table name: yarns_needles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  needle_id  :bigint           not null
#  yarn_id    :bigint           not null
#
# Indexes
#
#  index_yarns_needles_on_needle_id  (needle_id)
#  index_yarns_needles_on_yarn_id    (yarn_id)
#
# Foreign Keys
#
#  fk_rails_...  (needle_id => needles.id)
#  fk_rails_...  (yarn_id => yarns.id)
#
class YarnsNeedle < ApplicationRecord
  belongs_to :yarn
  belongs_to :needle
end
