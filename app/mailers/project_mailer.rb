class ProjectMailer < ApplicationMailer
  def project_created(project, user)
    @project = project

    mail(to: user.email)
  end

  def project_destroyed(project_name, project_user_email)

    @project_name = project_name

    mail(to: project_user_email)
  end

  def project_updated(project)
    @project = project

    mail(to: project.users.pluck(:email))
  end
end
