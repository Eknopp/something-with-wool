class ProjectsHook < ApplicationRecord
  belongs_to :project
  belongs_to :hook
end
