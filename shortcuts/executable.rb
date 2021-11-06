# frozen_string_literal: true

require 'mkmf'

module Shortcuts
  module Executable
    EXECUTABLE_NAME = 'shortcuts'

    class << self
      def list
        execute(:list).to_s.split("\n")
      end

      private

      def execute(command)
        `shortcuts #{command}` if available?
      end

      def available?
        !!find_executable(EXECUTABLE_NAME)
      end
    end
  end
end
