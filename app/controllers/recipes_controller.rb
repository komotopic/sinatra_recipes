class RecipeController < ApplicationController

    get '/recipes' do
       @recipes = Recipe.all
        erb :'recipes/recipe_index'
    end

    post '/recipes' do
        if !is_logged_in?
            redirect to '/login'
        end
        recipe = Recipe.new(params)
        recipe.save
        binding.pry
        redirect to '/recipes'
    end

    get '/recipes/new' do
        if !is_logged_in?
            redirect to '/login'
        end

        erb :'recipes/new'
    end

    

    get '/recipes/:id' do
        if !is_logged_in?
            redirect to '/login'
        end
        @recipe = Recipe.find(params[:id])
        binding.pry

        erb :'recipes/show'
    end

    get 'recipes/:id/edit' do
        if !is_logged_in?
            redirect to '/login'
        end
    end

    patch '/recipes/:id' do
        if !is_logged_in?
            redirect to '/login'
        end
    end

    get 'recipes/:id/delete' do
        if !is_logged_in?
            redirect to '/login'
        end
    end


end