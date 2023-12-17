module TestGuru
  MAJOR = 0
  MINOR = 1
  PATCH = 0

  VERSION = "#{MAJOR}.#{MINOR}.#{PATCH}".freeze

  def self.current_version
    VERSION
  end
end
