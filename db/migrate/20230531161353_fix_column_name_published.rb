# frozen_string_literal: true

class FixColumnNamePublished < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :posts, :pubished, :published
  end
end
