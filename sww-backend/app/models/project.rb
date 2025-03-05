# == Schema Information
#
# Table name: projects
#
#  id               :bigint           not null, primary key
#  gauge_pattern    :string
#  name             :string
#  notes            :string
#  project_finished :date
#  project_started  :date
#  rows             :decimal(, )
#  size             :string
#  status           :string
#  stitches         :decimal(, )
#  swatch_size      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pattern_id       :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_projects_on_pattern_id  (pattern_id)
#  index_projects_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (pattern_id => patterns.id)
#  fk_rails_...  (user_id => users.id)
#
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
