class Project < ApplicationRecord
  belongs_to :pattern

  validates :status, inclusion: {in: %w[in_queue in_progress finished], message: "%{value} is not a valid status"}
end
