module MusicSanitizer
  class Processor
    IGNORE = YAML.load_file(File.join(MusicSanitizer.root, "lists/ignore.yml"))
    EXCLUDE = YAML.load_file(File.join(MusicSanitizer.root, "lists/exclude.yml"))

    def initialize(content)
      @content = content
    end

    def process
      string = @content.strip

      EXCLUDE.each do |exclude|
        string = string.gsub(/[^ ]*#{exclude}.*$/i, "")
      end

      # Sub
      string = string.gsub(/´/, "'").gsub(/`/, "'")

      # Song - A "abc def" => Song - A
      # Song - A [B + C] => Song - A
      # Song A B.mp3 => Song A B
      # 10. Song => Song
      [
        /\.mp3$/, 
        /\[[^\]]*\]/, 
        /".*"/,  
        /(\s+|^)'.*'(\s+|$)/
      ].each do |reg|
        string = string.gsub(reg, " ").strip
      end
      
      [
        /\(.*?(\)|$)/m, 
        /[^a-z0-9]feat(.*?)\s*[^\s]+/i, 
        /[-]+/, 
        /[\s]+/m, 
        /\_/
      ].each do |reg|
        string = string.gsub(reg, " ").strip
      end

      # Split
      # A ft. B => A
      string = string.split(/ft\.\s+/i).first
      # A + B => A
      string = string.split(/\s+\+\s+/).first

      EXCLUDE.each do |exclude|
        string = string.gsub(/#{exclude}.*$/i, "")
      end
      
      string.gsub(/\A\s|\s\z/, "").gsub(/\s+/, " ").strip.downcase
    rescue Encoding::CompatibilityError, Encoding::UndefinedConversionError, ArgumentError
      return string
    end

    def self.ignore?(this, compare = nil)
      IGNORE.
        reject{ |value| compare.to_s.match(/#{value}/i) }.
        map{ |value| this.match(/#{value}/i) }.any?
    rescue ArgumentError
      return false
    end
  end
end