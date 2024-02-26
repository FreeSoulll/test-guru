class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gist

  validates :body, :test_id, presence: true
end
