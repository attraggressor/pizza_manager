class CompanyBranch < ActiveRecord::Base
  has_many :company_branch_product, dependent: :destroy
  has_many :products, through: :company_branch_product
  
  has_many :business_hour, dependent: :destroy
  accepts_nested_attributes_for :products

  validates_presence_of :name
  validates_uniqueness_of :name
end
