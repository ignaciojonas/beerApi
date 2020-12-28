# frozen_string_literal: true

class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :rating
      t.belongs_to :style
      t.timestamps
    end
  end
end
