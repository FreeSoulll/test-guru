class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, :test_id, presence: true
end
