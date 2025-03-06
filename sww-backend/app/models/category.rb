# == Schema Information
#
# Table name: categories
#
#  id               :bigint           not null, primary key
#  category_level_1 :string           not null
#  category_level_2 :string           not null
#  category_level_3 :string
#  category_level_4 :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_categories_on_category_level_1  (category_level_1)
#  index_categories_on_category_level_2  (category_level_2)
#
class Category < ApplicationRecord
  has_many :patterns_categories
  has_many :patterns, through: :patterns_categories
  has_many :projects_categories
  has_many :projects, through: :projects_categories
end
