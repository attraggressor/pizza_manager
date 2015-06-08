class Ingredient < ActiveRecord::Base
  has_many :product_ingredient, dependent: :destroy
  has_many :products, through: :product_ingredient
  
  validates_presence_of :name
  validates_uniqueness_of :name

  def ingredient_label
    self.name
  end

end
