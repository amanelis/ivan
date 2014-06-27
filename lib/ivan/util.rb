module Ivan
  class Util
    class << self
      
      def validate_models(path, type = 'rspec')
        path  = normalize_path path
        cases = [ has_files?("#{path}app/models") ]

        case type.to_sym
          when :rspec
            cases << has_files?("#{path}spec/models")
          when :testunit
            cases << has_files?("#{path}test/models")
          else
            cases = []
        end

        cases.any?
      end
     
      private
      def has_files?(full_path)
        Dir.entries(full_path).reject { |f|
          f.eql?('.') || f.eql?('..')
        }.any? rescue false
      end
      
      def normalize_path(path)
        return path if path[-1,1].eql?('/') 
        return path + '/' if path[-1,1].eql?('.')
        return path
      end

    end
  end
end
