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
require "test_helper"

class PurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
