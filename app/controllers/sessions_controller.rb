class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
       
    end

    post '/logout' do
        session.clear
        erb :'sessions/login'
    end
end