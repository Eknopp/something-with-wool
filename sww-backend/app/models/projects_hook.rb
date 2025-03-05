# == Schema Information
#
# Table name: projects_hooks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hook_id    :bigint           not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_projects_hooks_on_hook_id     (hook_id)
#  index_projects_hooks_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (hook_id => hooks.id)
#  fk_rails_...  (project_id => projects.id)
#
class ProjectsHook < ApplicationRecord
  belongs_to :project
  belongs_to :hook
end
