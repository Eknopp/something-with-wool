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
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
