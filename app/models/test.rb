class Test < ApplicationRecord
  has_many :test_results
  has_many :users, through: :test_results
  has_many :questions
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, ->(category) { Test.joins(:category).where('category.title': category) }

  validates :title, :level, :category_id, :creator_id, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.sorted_tests(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
