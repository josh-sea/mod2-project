class Rep < ApplicationRecord
  has_many :accounts
  has_many :reports
  has_secure_password


  def sort_account_inspections
    sorted_hash = {}
     self.accounts.each do |account|
        sorted_hash[account] = account.inspections.sort_by &:inspection_date
    end
    sorted_hash
  end

  def reassign_rep(new_rep_id)
    self.accounts.each do |account|
      account.update(rep_id: new_rep_id)
    end
    self.reports.each do |report|
      report.update(rep_id: new_rep_id)
    end
  end

end #end of rep model
