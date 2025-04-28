# == Schema Information
#
# Table name: yarns
#
#  id            :bigint           not null, primary key
#  brand_name    :string
#  colors        :string           default([]), is an Array
#  dye           :string
#  fibers        :string           not null
#  gauge         :string
#  machine_wash  :boolean
#  meterage      :decimal(, )      not null
#  name          :string           not null
#  notes         :text
#  origin        :string
#  pictures_path :string
#  texture       :string
#  unit_weight   :decimal(, )      not null
#  weight        :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_yarns_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class YarnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
