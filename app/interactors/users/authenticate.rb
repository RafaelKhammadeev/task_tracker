module Users
  class Authenticate
    include Interactor::Organizer

    organize Users::Authenticate::Execute,
             Users::GenerateToken
  end
end