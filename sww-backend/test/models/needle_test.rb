# == Schema Information
#
# Table name: needles
#
#  id         :bigint           not null, primary key
#  metric     :string
#  uk_size    :string
#  us_size    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class NeedleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
