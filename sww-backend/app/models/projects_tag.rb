# == Schema Information
#
# Table name: projects_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_projects_tags_on_project_id  (project_id)
#  index_projects_tags_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (tag_id => tags.id)
#
class ProjectsTag < ApplicationRecord
  belongs_to :project
  belongs_to :tag
end
