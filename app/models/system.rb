class System < ApplicationRecord
  belongs_to :account
  has_many :inspections
  has_many :reports
  has_many :products
end
