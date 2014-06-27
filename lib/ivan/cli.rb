require 'ivan'
require 'ivan/util'

require 'thor'
require 'yaml'

module Ivan
  class Cli < Thor
    package_name 'Ivan'

    def initialize(*args)
      super
    end

    desc "rspec_models", "Copies annotations and creates basic tests [:attributes, :associations]"
    def rspec_models(app_path)
      return unless Util.validate_models app_path
      express(app_path, 2)

      spawn_annotator app_path
    end

    private
    def express(string, level, options = {})
      color_before, color_after = nil, '\033[0m'

      case level
      when 0
        color_before = '\033[35m'
      when 1
        color_before = '\033[34m'
      when 2
        color_before = '\033[36m'
      when 3
        color_before = '\033[31m'
      end

      puts "#{color_before}**#{string}**#{color_after}"
    end
  end
end
