class UserController < ApplicationController

   

    get '/sign_up' do
        erb :'users/sign_up'
        
       
    end

    post '/sign_up' do
       u = User.new(params)
       if u.email.blank? || u.password.blank?

       elsif  User.find_by(email: params[:email])
        redirect to '/user_exists'

       else   
        u.save
        session[:user_id] = u.id
        redirect to '/login'
       end


    end

    get '/user_exists' do
        erb :'users/user_exists'
    end

    
end