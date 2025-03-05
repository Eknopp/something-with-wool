# == Schema Information
#
# Table name: projects_needles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  needle_id  :bigint           not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_projects_needles_on_needle_id   (needle_id)
#  index_projects_needles_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (needle_id => needles.id)
#  fk_rails_...  (project_id => projects.id)
#
class ProjectsNeedle < ApplicationRecord
  belongs_to :project
  belongs_to :needle
end
