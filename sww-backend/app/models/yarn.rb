# == Schema Information
#
# Table name: yarns
#
#  id            :bigint           not null, primary key
#  brand_name    :string
#  colors        :string           default([]), is an Array
#  dye           :string
#  fibers        :string           not null
#  gauge         :string
#  machine_wash  :boolean
#  meterage      :decimal(, )      not null
#  name          :string           not null
#  notes         :text
#  origin        :string
#  pictures_path :string
#  texture       :string
#  unit_weight   :decimal(, )      not null
#  weight        :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_yarns_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Yarn < ApplicationRecord
  has_many :users_yarns
  has_many :users, through: :users_yarns
  has_many :patterns_yarns
  has_many :patterns, through: :patterns_yarns
  has_many :projects_yarns
  has_many :projects, through: :projects_yarns
  has_many :yarns_needles
  has_many :needles, through: :yarns_needles
  has_many :yarns_hooks
  has_many :hooks, through: :yarns_hooks

  has_many :favorites, as: :favoritable

  validates :weight, inclusion: {in: %w[Lace Super\ Fine Fine Light]}
  validates :name, uniqueness: {scope: :brand_name, case_sensitive: false, message: "should be unique within the same brand"}
end
