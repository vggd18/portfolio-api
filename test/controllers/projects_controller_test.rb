require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url, as: :json
    assert_response :success
  end

  test "should create project" do
    assert_difference("Project.count") do
      post projects_url, params: { project: { catrgory: @project.catrgory, demo_url: @project.demo_url, description: @project.description, design_patterns: @project.design_patterns, documentation_url: @project.documentation_url, endpoints: @project.endpoints, features: @project.features, github_url: @project.github_url, is_featured: @project.is_featured, order_index: @project.order_index, results: @project.results, status: @project.status, technologies: @project.technologies, title: @project.title } }, as: :json
    end

    assert_response :created
  end

  test "should show project" do
    get project_url(@project), as: :json
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { catrgory: @project.catrgory, demo_url: @project.demo_url, description: @project.description, design_patterns: @project.design_patterns, documentation_url: @project.documentation_url, endpoints: @project.endpoints, features: @project.features, github_url: @project.github_url, is_featured: @project.is_featured, order_index: @project.order_index, results: @project.results, status: @project.status, technologies: @project.technologies, title: @project.title } }, as: :json
    assert_response :success
  end

  test "should destroy project" do
    assert_difference("Project.count", -1) do
      delete project_url(@project), as: :json
    end

    assert_response :no_content
  end
end
