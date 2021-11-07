# frozen_string_literal: true

module Shortcuts
  module Executable
    EXECUTABLE_NAME = 'shortcuts'

    class << self
      def list
        execute(:list).to_s.split("\n")
      end

      private

      def execute(command)
        `#{EXECUTABLE_NAME} #{command}` if available?
      end

      def available?
        !executable_path.empty? && File.executable?(executable_path)
      end

      def executable_path
        @executable_path ||= `which #{EXECUTABLE_NAME}`.strip
      end
    end
  end
end
