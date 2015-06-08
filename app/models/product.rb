class Product < ActiveRecord::Base
  has_many :company_branch_product, dependent: :destroy
  has_many :company_branches, through: :company_branch_product

  has_many :product_ingredient, dependent: :destroy
  has_many :ingredients, through: :product_ingredient

  validates_presence_of :name
  validates_uniqueness_of :name

  def product_label
    name
  end
end
