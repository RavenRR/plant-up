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
        if logged_in?
            if @posts.user == current_user 
            erb :'/posts/edit'
        else 
            @error = "You do not have permission to edit this post."
        end
    else
        redirect '/posts'
    end
end

    patch '/posts/:id' do
        @posts = Post.find(params[:id])
        if !params["post"]["title"].empty?
            @posts.update(params["post"])
            redirect "/posts"
        else
            @error = "Invalid. Please enter again."
            erb :'/posts/show'
        end
    end

    #destroy

    delete '/posts/:id' do
        posts = Post.find(params[:id])
        if logged_in?
            if posts.user == current_user
                posts.destroy
                redirect '/posts'
            else 
                @error = "You do not have permission to delete this post."
            end
        else
            redirect '/posts'
        end
    end
end