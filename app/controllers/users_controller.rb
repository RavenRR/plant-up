class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        if user = User.new(params)
        session[:user_id] = user.id
            redirect '/posts'
        else
            @error = "Invalid credentials"
            erb :'/users/signup'
        end
    end
end

