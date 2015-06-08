class CompanyBranchProduct < ActiveRecord::Base
  belongs_to :company_branch
  belongs_to :product
end
