class ProjectSerializer
  include JSONAPI::Serializer
  attributes :id, :gauge_pattern, :name, :notes, :project_finished, :project_started, :rows, :size, :status,
    :stitches, :swatch_size, :created_at, :updated_at, :pattern_id, :user_id
end
