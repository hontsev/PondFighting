class FightResult < ApplicationRecord
  belongs_to :fight
  belongs_to :duck
end
