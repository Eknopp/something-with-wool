# == Schema Information
#
# Table name: users_yarns
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  yarn_id    :bigint           not null
#
# Indexes
#
#  index_users_yarns_on_user_id  (user_id)
#  index_users_yarns_on_yarn_id  (yarn_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (yarn_id => yarns.id)
#
class UsersYarn < ApplicationRecord
  belongs_to :user
  belongs_to :yarn
end
