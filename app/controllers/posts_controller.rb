class PostsController < ApplicationController

    get '/posts/new' do
        erb :'/posts/new'

    end
    
    post '/posts' do
        post = Post.new(params)
        if !post.title.empty? && !post.method.empty?
            post.save
            redirect '/posts'
            

        else
            @error = "Invalid. Please enter again."
            erb :'/posts/new'
    
    end
end

    get '/posts' do
        @posts = Post.all.reverse
        erb :'/posts/index'
    end

    get '/posts/id' do 
        @post = Post.find(params["id"])
        erb :'/posts/show'
    end
end