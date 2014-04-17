require "music_sanitizer/version"

module MusicSanitizer
  def self.root
    File.expand_path('../..', __FILE__)
  end
end

require "music_sanitizer/processor"