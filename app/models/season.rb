class Season < ApplicationRecord
  has_many :episodes
  has_many :purchases
  has_many :users, :through => :purchases
end
