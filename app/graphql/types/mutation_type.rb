module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn

    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject

    field :create_task, mutation: Mutations::CreateTask
    field :update_user, mutation: Mutations::UpdateUser
  end
end
