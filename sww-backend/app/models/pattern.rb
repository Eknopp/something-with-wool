# == Schema Information
#
# Table name: patterns
#
#  id                   :bigint           not null, primary key
#  archived_at          :datetime
#  craft_type           :string           not null
#  currency             :string
#  difficulty_rating    :integer
#  first_published_date :date             not null
#  gauge_pattern        :string
#  languages            :string           default(["en"]), is an Array
#  likes                :integer
#  name                 :string           not null
#  nbr_rows             :integer          not null
#  nbr_stitches         :integer          not null
#  notes                :string
#  overall_rating       :integer
#  overall_yarn_weight  :string           not null
#  pdf_path             :string           not null
#  pictures_path        :string           not null
#  price                :float
#  release_date         :date
#  repeats              :integer
#  sizes                :string           default([]), is an Array
#  swatch_size          :integer          not null
#  total_yardage        :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_patterns_on_craft_type  (craft_type)
#  index_patterns_on_name        (name)
#  index_patterns_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Pattern < ApplicationRecord
  require Rails.root.join("config/valid_currencies")

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
  validates :overall_yarn_weight, inclusion: {in: %w[lace super_fine fine light], message: "%{value} is not a valid overal yarn weight"}
  validates :sizes, inclusion: {in: %w[XS S M L XL XXL 3XL 4XL 5XL 6XL], message: "%{value} is not a valid size"}
  validates :difficulty_rating, inclusion: {in: 1..5, message: "%{value} is not a valid difficulty rating"}
  validates :overall_rating, inclusion: {in: 1..5, message: "%{value} is not a valid overall rating"}
  validates :currency, inclusion: {in: VALID_CURRENCIES}
end
