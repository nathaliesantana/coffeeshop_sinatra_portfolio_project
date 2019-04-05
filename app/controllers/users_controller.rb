class UsersController < ApplicationController

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect'/custombeverages' #a list of all users beverages.
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/custombeverages'
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

  get '/logout' do

    if !!logged_in?
      session.destroy
      redirect'/login'
    else
      redirect'/'
    end
  end

end
