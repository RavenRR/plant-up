require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, 'any'
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  error Sinatra::NotFound do
    content_type 'text/plain'
    [404]
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    unless logged_in?
      redirect '/login'
    end
  end

  def user 
    user = User.find_by(username: params["username"])
  end
  def user_params_empty
    params["username"].empty? || params["password"].empty?
  end
end

