# frozen_string_literal: true

class AddNameIndexToStyles < ActiveRecord::Migration[6.1]
  def change
    add_index :styles, :name, unique: true, if_not_exists: true
  end
end
