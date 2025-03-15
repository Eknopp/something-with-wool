class V1::PatternsController < ApplicationController
  include ActionController::Cookies

  def index
    render_success("index.success", nil, PatternSerializer.new(Pattern.active.order(release_date: :desc)).serializable_hash)
  end

  def show
    pattern = Pattern.find(params[:id])
    render_success("show.success", nil, PatternSerializer.new(pattern).serializable_hash)
  end

  def create
    pattern = Pattern.new(pattern_params)

    pattern.user = current_user

    if pattern.save
      render_success("create.success", PatternSerializer.new(pattern).serializable_hash, nil)
    else
      render_error("create.failure", pattern.errors, nil)
    end
  end

  def update
    pattern = Pattern.find(params[:id])

    if pattern.update(pattern_params)
      render_success("update.success", PatternSerializer.new(pattern).serializable_hash, nil)
    else
      render_error("update.failure", pattern.errors, nil)
    end
  end

  def archive
    pattern = Pattern.find(params[:id])

    if pattern.archive!
      render_success("archive.success", nil, PatternSerializer.new(pattern).serializable_hash)
    else
      render_unprocessable_entity("archive.error", pattern.errors)
    end
  end

  private

  def pattern_params
    params.expect(pattern: [:id, :name, :difficulty, :description, :craft_type, :currency, :difficulty_rating,
      :first_published_date, :gauge_pattern, :languages, :likes, :nbr_rows, :nbr_stitches, :notes,
      :overall_rating, :overall_yarn_weight, :pdf_path, :pictures_path, :price, :release_date,
      :repeats, :sizes, :swatch_size, :total_yardage])
  end
end
