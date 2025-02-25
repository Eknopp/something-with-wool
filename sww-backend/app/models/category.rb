class Category < ApplicationRecord
  has_many :patterns_categories
  has_many :patterns, through: :patterns_categories
  has_many :projects_categories
  has_many :projects, through: :projects_categories
end
