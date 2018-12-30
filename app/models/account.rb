class Account < ApplicationRecord
  belongs_to :rep
  has_many :systems
  has_many :inspections

  def last_inspection
      inspections.select do |inspection|
        inspection.created_at <= Time.now - 90.days
      end
  end

end
