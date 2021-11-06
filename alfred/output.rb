# frozen_string_literal: true

require 'json'

module Alfred
  class Output
    attr_reader :items, :subtitle_prefix, :icon

    def initialize(items, subtitle_prefix: nil, icon: nil)
      @items = Array(items)
      @subtitle_prefix = subtitle_prefix
      @icon = icon
    end

    def build
      {
        items: build_items_array
      }.to_json
    end

    private

    def build_items_array
      items.map do |item|
        Item.new(item, subtitle_prefix, icon).to_json
      end
    end
  end
end
