class Account < ApplicationRecord
  belongs_to :rep
  has_many :systems
end
