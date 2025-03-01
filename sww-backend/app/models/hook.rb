class Hook < ApplicationRecord
  has_many :patterns_hooks
  has_many :patterns, through: :patterns_hooks
  has_many :projects_hooks
  has_many :projects, through: :projects_hooks
  has_many :projects_hooks
  has_many :projects, through: :projects_hooks
  has_many :yarns_hooks
  has_many :yarns, through: :yarns_hooks
end
