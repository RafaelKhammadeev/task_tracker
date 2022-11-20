class ProjectMailer < ApplicationMailer
  def project_created(project, user)
    @project = project
    binding.pry

    mail(to: user.email)
  end

  def project_destroyed(project)
    @project = project
    binding.pry
    mail(to: user.email)
  end
end
