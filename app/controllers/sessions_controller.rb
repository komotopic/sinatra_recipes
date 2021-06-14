class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
       user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/recipes'
        else
            redirect to '/login'
        end
    end

    get '/new_log' do
        session.clear
        redirect to '/login'
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end
end