# == Schema Information
#
# Table name: projects_yarns
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  yarn_id    :bigint           not null
#
# Indexes
#
#  index_projects_yarns_on_project_id  (project_id)
#  index_projects_yarns_on_yarn_id     (yarn_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (yarn_id => yarns.id)
#
class ProjectsYarn < ApplicationRecord
  belongs_to :project
  belongs_to :yarn
end
