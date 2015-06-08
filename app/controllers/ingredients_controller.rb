class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      render :show
    else
      render :new
    end
  end

  def update
    if @ingredient.update_attributes(ingredient_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

    def find_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end