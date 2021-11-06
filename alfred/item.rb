# frozen_string_literal: true

module Alfred
  class Item
    attr_reader :title, :subtitle_prefix, :icon

    def initialize(title, subtitle_prefix, icon)
      @title = title
      @subtitle_prefix = subtitle_prefix
      @icon = icon
    end

    def to_json(*)
      {
        title: title,
        arg: title
      }.tap do |result|
        append_icon(result)
        append_subtitle(result)
      end
    end

    private

    def append_icon(result)
      result[:icon] = icon if icon
    end

    def append_subtitle(result)
      return unless subtitle_prefix

      result[:subtitle] = "#{subtitle_prefix} #{title}"
    end
  end
end
