class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  PRIVATE_RULTES_TEXT = {
    tests_from_category: I18n.t('badges.tests_from_category'),
    test_from_first_try: I18n.t('badges.test_from_first_try'),
    tests_from_level: I18n.t('badges.tests_from_level')
  }.freeze

  def self.badge_rules
    PRIVATE_RULTES_TEXT
  end

  def badge_image(link_image)
    link_image.include?('http') ? link_image : 'default-badge.jpg'
  end
end
