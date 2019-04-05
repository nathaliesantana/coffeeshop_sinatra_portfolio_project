class UsersController < ApplicationController

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect'/custom_beverages' #a list of all users beverages.
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/custom_beverages'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'login'
  end

  get '/signup' do
    erb :'signup'
  end

end
