# == Schema Information
#
# Table name: yarns
#
#  id            :bigint           not null, primary key
#  colors        :string           default([]), is an Array
#  dye           :string
#  fibers        :string           not null
#  gauge         :string
#  machine_wash  :boolean
#  meterage      :decimal(, )      not null
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
class YarnSerializer
  include JSONAPI::Serializer
  attributes :id, :colors, :dye, :fibers, :gauge, :machine_wash, :meterage, :notes,
    :origin, :pictures_path, :texture, :unit_weight, :weight, :created_at, :updated_at, :user_id
end
