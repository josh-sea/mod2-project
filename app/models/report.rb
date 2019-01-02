class Report < ApplicationRecord
  has_many :tests
  belongs_to :account
  belongs_to :rep
end
