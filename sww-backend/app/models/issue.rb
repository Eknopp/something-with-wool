# == Schema Information
#
# Table name: issues
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  pictures_path :string
#  release_date  :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  magazine_id   :bigint           not null
#
# Indexes
#
#  index_issues_on_magazine_id   (magazine_id)
#  index_issues_on_name          (name)
#  index_issues_on_release_date  (release_date)
#
# Foreign Keys
#
#  fk_rails_...  (magazine_id => magazines.id)
#
class Issue < ApplicationRecord
  belongs_to :magazine
end
