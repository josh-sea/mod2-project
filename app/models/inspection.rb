class Inspection < ApplicationRecord
  belongs_to :system
  belongs_to :account

  def inspection_choices
    choices = {"Good Condition" => 1, "Some Noticable Aging" => 2, "Action Needed" => 3}
  end

  def insp_track_helper
    date = self.inspection_date + 90.days
    date.strftime("%^B %d, %Y")
  end

  def inspection_track
    if self == nil
      ["Sorry no inspections availabel for this account"]
    else
      if self.inspection_date + 90.days < Time.now
      "You are past your inspection due date, it was due #{insp_track_helper}!"
      else
      "Your next inspection should be on #{insp_track_helper}."
      end
    end 
  end

  def self.systems_uniq
    systems_array = System.all.uniq
  end
end
