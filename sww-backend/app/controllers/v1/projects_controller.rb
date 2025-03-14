class V1::ProjectsController < ApplicationController
  include ActionController::Cookies

  def index
    render_success("index.success", nil, ProjectSerializer.new(Project.order(created_at: :desc)).serializable_hash)
  end

  def show
    project = Project.find(params[:id])
    render_success("show.success", nil, ProjectSerializer.new(project).serializable_hash)
  end

  def create
    project = Project.new(project_params)

    project.user = current_user

    if project.save
      render_success("create.success", ProjectSerializer.new(project).serializable_hash, nil)
    else
      render_error("create.failure", project.errors, nil)
    end
  end

  def update
    project = Project.find(params[:id])

    if project.update(project_params)
      render_success("update.success", ProjectSerializer.new(project).serializable_hash, nil)
    else
      render_error("update.failure", project.errors, nil)
    end
  end

  def destroy
    project = Project.find(params[:id])

    if project.destroy
      render_success("destroy.success", {id: project.id}, {})
    else
      render_unprocessable_entity("destroy.error", project.errors)
    end
  end

  private

  def project_params
    params.expect(project: [:id, :gauge_pattern, :name, :notes, :project_finished, :project_started,
      :rows, :size, :status, :stitches, :swatch_size, :pattern_id])
  end
end
