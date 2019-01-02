class Rep < ApplicationRecord
  has_many :accounts
  has_many :reports

  def sort_account_inspections
    sorted_hash = {}
     self.accounts.each do |account|
        sorted_hash[account] = account.inspections.sort_by &:inspection_date
    end
    sorted_hash
  end

end #end of rep model
