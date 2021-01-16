class UsersController < ApplicationController

    #Sign up
    get '/signup' do
        erb :'users/signup.erb'

    # user delete account