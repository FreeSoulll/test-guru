class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.select do |badge|
      add_badge = send("#{badge.badge_type}?", badge)

      @user.badges << badge if add_badge
    end
  end

  private

  def tests_from_category?(badge)
    return unless @test.category.title.downcase == badge.rule.downcase

    category_tests = Test.tests_by_category(@test.category.title).published_tests
    passed_tests = @user.test_passages
                        .joins(:test)
                        .where(success: true, "tests.category_id": @test.category_id)
                        .pluck(:test_id)

    category_tests.pluck(:id).sort == passed_tests.uniq.sort if unic_test?
  end

  def tests_from_level?(badge)
    return unless @test.level == badge.rule.to_i

    tests = Test.by_level(@test.level).published_tests
    passed_tests = @user.test_passages
                        .joins(:test)
                        .where(success: true, "tests.level": @test.level)
                        .pluck(:test_id)

    tests.pluck(:id).sort == passed_tests.uniq.sort if unic_test?
  end

  def test_from_first_try?(badge)
    unic_test?
  end

  def unic_test?
    @user.tests.where(id: @test.id).count == 1
  end
end
