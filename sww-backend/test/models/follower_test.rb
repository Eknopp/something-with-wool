# == Schema Information
#
# Table name: followers
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followee_id :bigint           not null
#  follower_id :bigint           not null
#
# Indexes
#
#  index_followers_on_followee_id  (followee_id)
#  index_followers_on_follower_id  (follower_id)
#
# Foreign Keys
#
#  fk_rails_...  (followee_id => users.id)
#  fk_rails_...  (follower_id => users.id)
#
require "test_helper"

class FollowerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
