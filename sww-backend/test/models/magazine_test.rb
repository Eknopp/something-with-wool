# == Schema Information
#
# Table name: magazines
#
#  id                 :bigint           not null, primary key
#  biography          :text
#  cover_picture_path :string
#  name               :string           not null
#  website            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_magazines_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class MagazineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
