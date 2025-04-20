class V1::PatternsController < ApplicationController
  include ActionController::Cookies

  def index
    patterns = Pattern.active.order(release_date: :desc)
    render_success("index.success", nil, PatternListSerializer.new(patterns).serializable_hash)
  end

  def show
    pattern = Pattern.find(params[:id])
    render_success("show.success", nil, PatternSerializer.new(pattern).serializable_hash)
  end

  def create
    ActiveRecord::Base.transaction do
      pattern = Pattern.new(pattern_params.except(:yarns))
      pattern.user = current_user

      pattern.save!
      associate_yarns_with_colors(pattern, pattern_params[:yarns]) if pattern_params[:yarns].present?
      render_success("create.success", PatternSerializer.new(pattern).serializable_hash, nil)
    end
  rescue => e
    render_unprocessable_entity("create.failure", e)
  end

  def update
    ActiveRecord::Base.transaction do
      pattern = Pattern.find(params[:id])

      pattern.update!(pattern_params.except(:yarns))
      associate_yarns_with_colors(pattern, pattern_params[:yarns]) if pattern_params[:yarns].present?
      render_success("update.success", PatternSerializer.new(pattern).serializable_hash, nil)
    end
  rescue => e
    render_unprocessable_entity("update.failure", e)
  end

  # TODO: archive method fix
  def archive
    pattern = Pattern.find(params[:id])

    if pattern.archive
      render_success("archive.success", nil, PatternSerializer.new(pattern).serializable_hash)
    else
      render_unprocessable_entity("archive.failure", pattern.errors)
    end
  end

  private

  def associate_yarns_with_colors(pattern, yarns)
    pattern.patterns_yarns.destroy_all # Clear existing associations

    yarns.each do |yarn_data|
      patterns_yarn = pattern.patterns_yarns.build(yarn_id: yarn_data[:yarn_id], color: yarn_data[:color])
      patterns_yarn.save!
    end
  rescue ActiveRecord::RecordInvalid => e
    raise StandardError.new("Failed to associate yarns with colors: #{e.record.errors.full_messages.join(", ")}")
  end

  def pattern_params
    params.expect(pattern: [:id, :name, :difficulty, :description, :craft_type, :currency, :difficulty_rating,
      :first_published_date, :gauge_pattern, :languages, :likes, :nbr_rows, :nbr_stitches, :notes,
      :overall_rating, :overall_yarn_weight, :pdf_path, :pictures_path, :price, :release_date,
      :repeats, :sizes, :swatch_size, :total_yardage, yarns: [[:yarn_id, :color]]])
  end
end
