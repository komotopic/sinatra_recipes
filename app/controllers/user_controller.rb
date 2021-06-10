class UserController < ApplicationController

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        u = User.new(params)
        if u.password.blank? || u.email.blank?
            redirect to '/login'
        else 
            
            redirect to '/recipe_index'
        end
    end

    get '/sign_up' do
        erb :'users/sign_up'
    end

    post '/sign_up' do
       u = User.new(params)

    end
end