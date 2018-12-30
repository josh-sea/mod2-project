class Inspection < ApplicationRecord
  belongs_to :system
  belongs_to :account

  def inspection_choices
    choices = {"Good Condition" => 1, "Some Noticable Aging" => 2, "Action Needed" => 3}
  end

  def self.systems_uniq
    systems_array = System.all.uniq
  end
end
