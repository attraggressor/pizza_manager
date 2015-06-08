class CreateCompanyBranchProducts < ActiveRecord::Migration
  def change
    create_table :company_branch_products do |t|
      t.integer :company_branch_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
