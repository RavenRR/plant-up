class SessionsController < ApplicationController
    #log in
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
            if user && user.authenticate(params["password"])
                session[:user_id] = user.id
                redirect '/posts'
            else
                @error = "Invalid. Please enter again."
                erb :'users/login'
            end
        end
    get '/logout' do
        session.clear
        redirect '/home'
    end
end