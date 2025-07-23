class SkillsController < ApplicationController
  before_action :set_skill, only: %i[ show update destroy ]

  # GET /skills
  def index
    @skills = Skill.proficiency
    render json: @skills
  end

  # POST /skills
  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      render json: @skill, status: :created
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /skills/:id
  def update
    if @skill.update(skill_params)
      render json: @skill
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /skills/:id
  def destroy
    @skill.destroy
    head :no_content
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_error('Skill not found', :not_found)
  end

    # Only allow a list of trusted parameters through.
    def skill_params
      params.require(:skill).permit(
        :name, 
        :category, 
        :proficiency, 
        :is_featured, 
        :order_index
      )
    end
end
