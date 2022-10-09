# эта штука по-другому называется ActiveRecord
class Task < ApplicationRecord
  validates :title, presence: true
  # все манипулюции над параметрами модели должны выполняться внутри модели
  # validates :deadline_at, deadline_at < created_at
  belongs_to :project
end