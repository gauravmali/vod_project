class Purchase < ApplicationRecord
  validates_presence_of :price, :quality

  belongs_to :user
  belongs_to :movie, optional: true
  belongs_to :season, optional: true

  before_create :save_validity

  def alive?
    self.validity > Time.now.utc
  end

  def save_validity
    self.validity = (Time.now.utc + 2.days)
  end
end
