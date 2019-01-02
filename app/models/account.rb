class Account < ApplicationRecord
  belongs_to :rep
  has_many :systems
  has_many :inspections
  has_many :reports

  def last_inspection
    if self.inspections.length == 0
      sorted = [Inspection.new()]
    else
    sorted = self.inspections.sort_by &:inspection_date
  end
    sorted.last
  end

##this == last_inspection but not ideal. Can use this to sort a new inspection date column)
  def last_inspection_two
    sorted = self.inspections.sort{|a,b| a.created_at <=> b.created_at}
    sorted.last
  end

end
