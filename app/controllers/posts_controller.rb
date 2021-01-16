class PostsController < ApplicationController

    before do
        require_login
    end

    get '/posts/new' do
        erb :'/posts/new'
    end

    post '/posts' do
        post = current_user.posts.build(params)
        if  post.save
            redirect '/posts'
        else
            @error = "Invalid. Please enter again."
            erb :'/posts/new'
    
    end
end 

    get '/posts' do
    if @posts = Post.all.reverse
        erb :'posts/index'
    else
        redirect "/login"
    end
end

    get '/posts/:id' do 
            @posts = Post.find_by(id: params[:id])
            if @posts
                erb :'posts/show'
            else
                redirect "/posts"
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