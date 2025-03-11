# == Schema Information
#
# Table name: hooks
#
#  id         :bigint           not null, primary key
#  hook_type  :string
#  metric_mm  :string           not null
#  uk_size    :string           not null
#  us_size    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
