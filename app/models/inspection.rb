class Inspection < ApplicationRecord
  belongs_to :system


  def self.systems_uniq
    systems_array = System.all.uniq
  end
end
