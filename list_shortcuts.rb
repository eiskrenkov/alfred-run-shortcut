# frozen_string_literal: true

require_relative 'shortcuts/executable'
require_relative 'shortcuts/output'

require_relative 'alfred/item'
require_relative 'alfred/output'

puts Shortcuts::Output.build
