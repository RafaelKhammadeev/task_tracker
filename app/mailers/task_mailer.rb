class TaskMailer < ApplicationMailer
  def task_created_owner(task, user)
    @task = task

    mail(to: user.email)
  end

  def task_created_member(task, user)
    @task = task
    @user = user
    users_member = task.project.users.pluck(:email) - [user.email]

    mail(to: users_member)
  end

  def task_destroyed_owner(task_title, project, user)
    @task_title = task_title
    @user = user
    owner_id = ProjectMembership.find_by(project: project, role: :owner).user_id

    mail(to: User.find(owner_id).email)
  end

  def task_destroyed_initiator(task_title, user)
    @task_title = task_title

    mail(to: user.email)
  end

  def task_destroyed_member(task_title, project, user)
    @task_title = task_title
    user_without_initiator = project.users.pluck(:email) - [user.email]

    mail(to: user_without_initiator)
  end

  def task_updated(task)
    @task = task

    mail(to: task.project.users.pluck(:email))
  end
end
