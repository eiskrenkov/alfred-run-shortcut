# frozen_string_literal: true

module Shortcuts
  module Output
    NO_SHORTCUTS_MESSAGE = 'No shortcuts available'
    ICON_NAME = 'icon.png'
    SUBTITLE_PREFIX = 'Run'

    class << self
      def build
        available_shortcuts = Shortcuts::Executable.list

        if available_shortcuts.empty?
          build_alfred_output(NO_SHORTCUTS_MESSAGE, icon: ICON_NAME)
        else
          build_alfred_output(available_shortcuts, subtitle_prefix: SUBTITLE_PREFIX, icon: ICON_NAME)
        end
      end

      private

      def build_alfred_output(items, options)
        Alfred::Output.new(items, **options).build
      end
    end
  end
end
