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
require "test_helper"

class ProjectsHookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
