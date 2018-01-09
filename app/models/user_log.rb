class UserLog < ApplicationRecord
  belongs_to :user
  belongs_to :fight
end
