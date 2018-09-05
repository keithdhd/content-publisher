# frozen_string_literal: true

class AddImageMetadataFields < ActiveRecord::Migration[5.2]
  def up
    execute "TRUNCATE images CASCADE"
    add_column :images, :caption, :string
    add_column :images, :alt_text, :string
    add_column :images, :credit, :string
  end

  def down
    remove_column :images, :caption
    remove_column :images, :alt_text
    remove_column :images, :credit
  end
end
