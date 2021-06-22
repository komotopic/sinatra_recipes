class RecipeController < ApplicationController

    get '/recipes' do
       @recipes = Recipe.all
        erb :'recipes/recipe_index'
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
        

        erb :'recipes/show'
    end

    get '/recipes/:id/edit' do
        if !is_logged_in?
            redirect to '/login'
        else
            @recipe = Recipe.find(params[:id])
            if @recipes.user != current_user
                redirect to '/recipes'
            end
            erb :'recipes/edit'
        end
    end

    post '/recipes' do
        if !is_logged_in?
            redirect to '/login'
        end
        @recipe = Recipe.new(params)
        @recipe.user_id = session[:user_id]
        @recipe.save
        
        redirect to '/recipes'
    end

    patch '/recipes/:id' do
        if !is_logged_in?
            redirect to '/login'
        else @recipe = Recipe.find(params[:id])
            if @recipes.user != current_user
                redirect to '/recipes'
            else
                @recipe.update(params["recipe"])
                redirect :'recipe/#{@recipe.id}'
            end
        end
    end

    get 'recipes/:id/delete' do
        if !is_logged_in?
            redirect to '/login'
        end
    end


end