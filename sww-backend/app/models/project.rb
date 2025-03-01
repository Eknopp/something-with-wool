class Project < ApplicationRecord
  belongs_to :pattern
  belongs_to :user
  has_many :favorites, as: :favoritable

  has_many :projects_yarns
  has_many :yarns, through: :projects_yarns
  has_many :projects_categories
  has_many :categories, through: :projects_categories
  has_many :projects_tags
  has_many :tags, through: :projects_tags
  has_many :projects_hooks
  has_many :hooks, through: :projects_hooks
  has_many :projects_needles
  has_many :needles, through: :projects_needles

  validates :status, inclusion: {in: %w[in_queue in_progress finished], message: "%{value} is not a valid status"}
end
