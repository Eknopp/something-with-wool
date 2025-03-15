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
class ProjectSerializer
  include JSONAPI::Serializer
  attributes :id, :gauge_pattern, :name, :notes, :project_finished, :project_started, :rows, :size, :status,
    :stitches, :swatch_size, :created_at, :updated_at, :pattern_id, :user_id
end
