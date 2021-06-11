class UserController < ApplicationController

   

    get '/sign_up' do
        erb :'users/sign_up'
    end

    post '/sign_up' do
       user = User.new(params)
       if user.email.blank? || user.password.blank?

       elsif  User.find_by(email: params[:email])
        redirect to '/user_exists'

       else   
        user.save
        
        redirect to '/login'
       end


    end

    get '/user_exists' do
        erb :'users/user_exists'
    end

    
end