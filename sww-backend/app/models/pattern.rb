class Pattern < ApplicationRecord
  belongs_to :user
  has_many :projects

  has_many :patterns_needles
  has_many :needles, through: :patterns_needles

  has_many :patterns_categories
  has_many :categories, through: :patterns_categories

  has_many :patterns_yarns
  has_many :yarns, through: :patterns_yarns

  has_many :patterns_tags
  has_many :tags, through: :patterns_tags

  has_many :patterns_hooks
  has_many :hooks, through: :patterns_hooks

  has_many :favorites, as: :favoritable
  has_many :purchases, as: :purchasable

  validates :craft_type, inclusion: {in: %w[knitting crochet weaving], message: "%{value} is not a valid craft type"}
  validates :overal_yarn_weight, inclusion: {in: %w[lace fingering sport dk], message: "%{value} is not a valid overal yarn weight"}
  validates :size, inclusion: {in: %w[XS S M L XL XXL 3XL 4XL 5XL 6XL], message: "%{value} is not a valid size"}
  validates :difficulty_rating, inclusion: {in: 1..5, message: "%{value} is not a valid difficulty rating"}
  validates :overall_rating, inclusion: {in: 1..5, message: "%{value} is not a valid overall rating"}
end
