require 'csv'

module Kiba
  module Uncommon
    module Sources
      class CSV
        attr_reader :input_file

        def initialize(input_file)
          @input_file = input_file
        end

        def each
          ::CSV.foreach(input_file, headers: true, header_converters: :symbol) do |row|
            yield(row.to_hash)
          end
        end
      end
    end
  end
end
