class RecipesController < ApplicationController

def index
@recipes = Recipe.all
end

def new
@recipe = Recipe.new
@ingredients = Ingredient.all
end

def create
@recipe = Recipe.new
@recipe.name = params[:recipe][:name]
@recipe.save
if params[:ingredient]
	params[:ingredient].each do |ingredient|
		@ingredient = Ingredient.find(ingredient)
		@recipe.ingredients << @ingredient
	end
end
redirect_to recipe_path(@recipe)
end

def show
@recipe = Recipe.find(params[:id])
end

def edit
@recipe = Recipe.find(params[:id])
@ingredients = Ingredient.all
end

def update
@recipe = Recipe.find(params[:id])
@recipe.update(params.require(:recipe).permit(:name))
@recipe.ingredients = []
@recipe.save
if params[:ingredient]
	params[:ingredient].each do |ingredient|
		@ingredient = Ingredient.find(ingredient)
		@recipe.ingredients << @ingredient
	end
end
redirect_to recipe_path(@recipe)
end





end