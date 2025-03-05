# == Schema Information
#
# Table name: needles
#
#  id         :bigint           not null, primary key
#  metric     :string
#  uk_size    :string
#  us_size    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Needle < ApplicationRecord
  has_many :patterns_needles
  has_many :patterns, through: :patterns_needles
  has_many :projects_needles
  has_many :projects, through: :projects_needles
  has_many :yarns_needles
  has_many :yarns, through: :yarns_needles
end
