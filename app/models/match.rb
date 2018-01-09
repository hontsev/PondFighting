class Match < ApplicationRecord
  has_many :fights
  belongs_to :user
end
