class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :movie, optional: true
  belongs_to :season, optional: true
end
