class Purchase < ApplicationRecord
  require "config/valid_currencies"

  belongs_to :purchasable, polymorphic: true
  belongs_to :user

  validates :currency, inclusion: {in: VALID_CURRENCIES}
end
