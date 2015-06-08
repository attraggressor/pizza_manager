class CreateCompanyBranches < ActiveRecord::Migration
  def change
    create_table :company_branches do |t|
      t.string :name
      t.string :address_zip_code
      t.string :address_city
      t.string :address_line

      t.timestamps null: false
    end
  end
end
