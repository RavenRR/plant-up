class SessionsController < ApplicationController
    #log in
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        
        if params["username"].empty? || params["password"].empty?
            @error = "Username and/or Password is blank"
            erb :'users/signup'
        else
            if user = User.find_by(username: params["username"], password: params["password"])
                session[:user_id] = user.id
                redirect '/posts'
            else
                @error = "Account not found"
                erb :'users/login'
            end
        end
    end

    get '/logout' do
        session.clear
        redirect '/'

    end
end