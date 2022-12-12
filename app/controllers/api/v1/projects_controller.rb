class Api::V1::ProjectsController < Api::ApplicationController
  def index
    @projects = Project.all

    render json: { projects: @projects }
  end

  def create # rubocop:disable Metrics/MethodLength
    @project = create_project.project
    if create_project.success?
      render json: { project: @project, errors: @project.errors }
    else
      render json: { project: {}, errors: @project.errors }
    end
  end

  private

  def create_project
    @create_project ||=
      Projects::Create.call(project_params: project_params, user: current_user)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def current_user
    return unless access_token.present?

    User.find_by(id: payload["sub"])
  end

  def access_token
    # Authorization: Bearer jie.123.ae
    @access_token ||= request.headers["Authorization"]&.split&.last
  end

  def payload
    ::JWT.decode(
      access_token, jwt_secret, true, { algorithm: "HS256" }
    ).first
  end

  def jwt_secret
    ENV.fetch("JWT_SECRET")
  end
end
