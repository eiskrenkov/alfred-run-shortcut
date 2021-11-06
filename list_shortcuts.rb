# frozen_string_literal: true

require_relative 'shortcuts/executable'
require_relative 'shortcuts/output'

require_relative 'alfred/item'
require_relative 'alfred/output'

MakeMakefile::Logging.quiet = true

puts Shortcuts::Output.build
