class Season < ApplicationRecord
  validates_presence_of :title, :plot, :number

  has_many :episodes
  has_many :purchases
  has_many :users, :through => :purchases
end
