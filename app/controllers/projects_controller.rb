class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show update destroy ]

  # GET /projects
  def index
    @projects = Project.all
    @projects = @projects.by_category(params[:category]) if params[:category].present?
    @projects = @projects.ordered

    render json: @projects
  end

  # GET /projects/:id
  def show
    render json: @project
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/:id
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/:id
  def destroy
    @project.destroy
    head :no_content
  end

  private
    def set_project
      @project = Project.find(params.expect(:id))
    rescue ActiveRecord::RecordNotFound
      render_error('Project not found', :not_found)
    end

  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :category,
      :status,
      :github_url,
      :demo_url,
      :documentation_url,
      :is_featured,
      :order_index,
      technologies: [],
      features: [],
      results: [],
      endpoints: [],
      design_patterns: []

    )
  end
end
