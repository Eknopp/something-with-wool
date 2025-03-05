# == Schema Information
#
# Table name: projects_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  project_id  :bigint           not null
#
# Indexes
#
#  index_projects_categories_on_category_id  (category_id)
#  index_projects_categories_on_project_id   (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (project_id => projects.id)
#
class ProjectsCategory < ApplicationRecord
  belongs_to :project
  belongs_to :category
end
