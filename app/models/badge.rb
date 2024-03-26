class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  PRIVATE_RULTES_TEXT = {
    category_backend: I18n.t('badges.category_backend'),
    test_from_first_try: I18n.t('badges.test_from_first_try'),
    test_from_four_level: I18n.t('badges.test_from_four_level')
  }.freeze

  def self.badge_rules
    PRIVATE_RULTES_TEXT
  end

  def badge_image(link_image)
    link_image.include?('http') ? link_image : 'default-badge.jpg'
  end
end
