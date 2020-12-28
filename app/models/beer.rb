class Beer < ApplicationRecord
    belongs_to :style
    validates_presence_of :name, :rating, :style
end
