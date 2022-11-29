module Users
  class Update
    include Interactor::Organizer

    organize Users::Update::Execute
  end
end
