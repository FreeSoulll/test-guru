class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.select { |badge| send("#{badge.badge_type}", badge) }
  end

  private

  def tests_from_category(badge)
    return unless @test.category.title.downcase == badge.rule.downcase && @test_passage.success?

    category_tests = Test.tests_by_category(@test.category.title).where(publish: true)
    passed_tests = @user.test_passages.joins(:test).where("tests.category_id": @test.category_id)
    success_passed_tests_id = passed_tests.map { |value| value.success? ? value.test_id : nil }.compact

    badge if category_tests.pluck(:id).sort == success_passed_tests_id.uniq.sort
  end

  def tests_from_level(badge)
    return unless @test.level == badge.rule.to_i && @test_passage.success?

    tests = Test.by_level(@test.level).where(publish: true)
    passed_tests = @user.test_passages.joins(:test).where("tests.level": @test.level)
    success_passed_tests_id = passed_tests.map { |value| value.success? ? value.test_id : nil }.compact

    badge if tests.pluck(:id).sort == success_passed_tests_id.uniq.sort
  end

  def test_from_first_try(badge)
    return unless @test_passage.success?

    badge if @user.tests.where(id: @test.id).count == 1
  end
end
