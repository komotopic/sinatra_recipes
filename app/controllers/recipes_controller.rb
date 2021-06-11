class RecipeController < ApplicationController

    get '/recipes' do
        erb :'recipes/recipe_index'
    end
end