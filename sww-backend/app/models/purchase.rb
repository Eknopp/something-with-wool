class Purchase < ApplicationRecord
  belongs_to :purchasable, polymorphic: true
  belongs_to :user
end
