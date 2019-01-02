class Test < ApplicationRecord
  belongs_to :report

  def rep_name
    self.report.name
  end
end #end of test class
