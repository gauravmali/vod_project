class Episode < ApplicationRecord
  validates_presence_of :title, :plot, :number

  belongs_to :season
end
