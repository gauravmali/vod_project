class User < ApplicationRecord
  has_many :purchases
  has_many :movies, :through => :purchases
  has_many :seasons, :through => :purchases
end
