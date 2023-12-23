class Test < ApplicationRecord
  has_many :users
  belongs_to :category

  def self.sorted_tests(category)
    Test.order(title: :desc).includes(:category).where(category: { title: category }).pluck(:title)
  end
end
