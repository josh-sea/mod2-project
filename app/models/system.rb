class System < ApplicationRecord
  belongs_to :account
  has_many :inspections
end
