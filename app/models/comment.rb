class Comment < ApplicationRecord
  extend Enumerize

  STATUS = ['Not started', 'Started', 'Finished'].freeze

  belongs_to :task
  belongs_to :user

  enumerize :status, in: STATUS

  validates :content, presence: true
end
