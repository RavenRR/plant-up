class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do

        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/posts'
        else
            @error = "Invalid. Please enter again."
            erb :'/users/signup'
        end
    end

    get '/myposts' do
        @posts = current_user.posts.reverse
        erb :'/posts/index'
    end
end

