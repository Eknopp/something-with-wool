class Category < ApplicationRecord
  has_many :patterns_categories
  has_many :patterns, through: :patterns_categories
end
