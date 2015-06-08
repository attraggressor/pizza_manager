class CreateProductIngredients < ActiveRecord::Migration
  def change
    create_table :product_ingredients do |t|
      t.integer :product_id
      t.integer :ingredient_id

      t.timestamps null: false
    end
  end
end
