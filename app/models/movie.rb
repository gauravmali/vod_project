class Movie < ApplicationRecord
  validates_presence_of :title, :plot

  has_many :purchases
  has_many :users, :through => :purchases
end
