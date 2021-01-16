class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Username and/or Password is blank"
            erb :'users/signup'
        elsif User.find_by(username: user.username)
            @error = "Username already exists"
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect '/posts'
        end
    end
end

