# frozen_string_literal: true

class Beer < ApplicationRecord
  belongs_to :style
  validates :name, :rating, :style, presence: true
end
