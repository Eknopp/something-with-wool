# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name)
#
class Tag < ApplicationRecord
  has_many :patterns_tags
  has_many :patterns, through: :patterns_tags
  has_many :projects_tags
  has_many :projects, through: :projects_tags
end
