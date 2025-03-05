# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
#  main_category :string           not null
#  sub_category  :string
#  type          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_categories_on_main_category  (main_category)
#  index_categories_on_type           (type)
#
class Category < ApplicationRecord
  has_many :patterns_categories
  has_many :patterns, through: :patterns_categories
  has_many :projects_categories
  has_many :projects, through: :projects_categories
end
