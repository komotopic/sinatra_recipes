class UserController < ApplicationController

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        u = User.new(params)
        
        if u.password.blank? || u.email.blank?
           
            redirect to '/login'
        else 
            u.save
            session[:user_id] = u.id
            binding.pry
            redirect to '/recipes'
            
        end
    end

    get '/sign_up' do
        erb :'users/sign_up'
    end

    post '/sign_up' do
       u = User.new(params)

    end

    post '/logout' do
        session.clear
    end
end