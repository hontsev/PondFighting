class Fight < ApplicationRecord
  belongs_to :user
  belongs_to :match
  has_many :fight_results
end
