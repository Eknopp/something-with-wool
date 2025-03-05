# == Schema Information
#
# Table name: purchases
#
#  id               :bigint           not null, primary key
#  currency         :string           default("EUR"), not null
#  price            :decimal(10, 2)   not null
#  purchasable_type :string           not null
#  purchase_date    :date             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  purchasable_id   :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_purchases_on_purchasable       (purchasable_type,purchasable_id)
#  index_purchases_on_purchasable_id    (purchasable_id)
#  index_purchases_on_purchasable_type  (purchasable_type)
#  index_purchases_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Purchase < ApplicationRecord
  require Rails.root.join("config", "valid_currencies")

  belongs_to :purchasable, polymorphic: true
  belongs_to :user

  validates :currency, inclusion: {in: VALID_CURRENCIES}
end
