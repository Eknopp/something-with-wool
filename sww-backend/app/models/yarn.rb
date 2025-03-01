class Yarn < ApplicationRecord
  has_many :users_yarns
  has_many :users, through: :users_yarns
  has_many :patterns_yarns
  has_many :patterns, throguh: :patterns_yarns
  has_many :projects_yarns
  has_many :projects, through: :projects_yarns
  has_many :yarns_needles
  has_many :needles, through: :yarns_needles
  has_many :yarns_hooks
  has_many :hooks, through: :yarns_hooks

  has_many :favorites, as: :favoritable

  validates :weight, inclusion: {in: %w[Lace Super\ Fine Fine Light]}
end
