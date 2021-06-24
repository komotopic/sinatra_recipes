class UserController < ApplicationController

   

    get '/sign_up' do
        erb :'users/sign_up'
    end

    post '/sign_up' do
       user = User.new(params)
       if user.email.blank? || user.password.blank?
        redirect to '/error_sign_up'

       elsif  User.find_by(email: params[:email])
        redirect to '/user_exists'
        
       elsif !user.email.include?('@')
        redirect to '/error_sign_up'

       else   
        user.save
        session[:user_id] = user.id
            redirect to '/recipes'
       end


    end

    get '/user_exists' do
        erb :'users/user_exists'
    end

    get '/error_sign_up' do
        erb :'users/error_sign_up'
    end

    
end