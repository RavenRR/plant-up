class SessionsController < ApplicationController
    #log in
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        if params["username"].empty? || params["password"].empty?
            @error = "Username/Password must be filled in." 
            erb :'users/login'
        else 
            if user && user.authenticate(params["password"])
                session[:user_id] = user.id
                redirect '/posts'
            else
                @error = "Did not recognize Username/Password. Please try again."
                erb :'users/login'
            end
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end