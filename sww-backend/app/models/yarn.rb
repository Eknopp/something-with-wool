class Yarn < ApplicationRecord
  has_many :user_yarns
  has_many :users, through: :user_yarns
  has_many :patterns_yarns
  has_many :patterns, throguh: :patterns_yarns
end
