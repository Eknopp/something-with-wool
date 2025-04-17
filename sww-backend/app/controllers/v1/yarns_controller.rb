class V1::YarnsController < ApplicationController
  include ActionController::Cookies

  def index
    render_success("index.success", nil, YarnSerializer.new(Yarn.order(created_at: :desc)).serializable_hash)
  end

  def show
    yarn = Yarn.find(params[:id])
    render_success("show.success", nil, YarnSerializer.new(yarn).serializable_hash)
  end

  def create
    yarn = Yarn.new(yarn_params)

    yarn.user_id = current_user.id

    if yarn.save
      render_success("create.success", YarnSerializer.new(yarn).serializable_hash, nil)
    else
      render_error("create.failure", yarn.errors, nil)
    end
  end

  def update
    yarn = Yarn.find(params[:id])

    if yarn.update(yarn_params)
      render_success("update.success", YarnSerializer.new(yarn).serializable_hash, nil)
    else
      render_error("update.failure", yarn.errors, nil)
    end
  end

  def destroy
    yarn = Yarn.find(params[:id])

    if yarn.destroy
      render_success("destroy.success", {id: yarn.id}, {})
    else
      render_unprocessable_entity("destroy.error", yarn.errors)
    end
  end

  def yarn_params
    params.expect(yarn: [:id, :colors, :dye, :fibers, :gauge, :machine_wash, :meterage,
      :notes, :origin, :pictures_path, :texture, :unit_weight, :weight, :user_id])
  end
end
