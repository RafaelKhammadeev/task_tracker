# эта штука по-другому называется ActiveRecord
class Task < ApplicationRecord
  belongs_to :project
end
