class CreateBusinessHours < ActiveRecord::Migration
  def change
    create_table :business_hours do |t|
      t.integer :company_branch_id
      t.string :day
      t.time :open_time
      t.time :close_time

      t.timestamps null: false
    end
  end
end
