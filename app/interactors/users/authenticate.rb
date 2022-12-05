module Users
  class Authenticate
    include Interactor::Organizer

    organize Users::Authenticate::CheckAuthenticate,
             Users::GenerateToken
  end
end
