class PostsController < ApplicationController


    get '/posts/new' do
    
        
        if User.find_by(id: session[:user_id])
        erb :'/posts/new'
        else
            redirect '/login'
        end
    end

    post '/posts' do
        post = Post.new(params)
        if !post.title.empty? 
            post.save
            redirect '/posts'
        else
            @error = "Invalid. Please enter again."
            erb :'/posts/new'
    
    end
end 

    get '/posts' do
        if User.find_by(id: session[:user_id])
        @posts = Post.all.reverse
        erb :'posts/index'
        else
            redirect "/login"
        end
    end

    get '/posts/:id' do 
        if User.find_by(id: session[:user_id])
        @posts = Post.find(params[:id])
        erb :'posts/show'
    else
        redirect "/login"
    end
end
    
    get '/posts/:id/edit' do
        @posts = Post.find(params[:id])
        erb :'/posts/edit'
    end

    patch '/posts/:id' do
        @posts = Post.find(params[:id])
        if !params["post"]["title"].empty?
            @posts.update(params["post"])
            redirect "/posts"
        else
            @error = "Invalid. Please enter again."
            erb :'/posts'
        end
    end

    #destroy

    delete '/posts/:id' do
        posts = Post.find(params[:id])
        posts.destroy
        redirect '/posts'
    end
end