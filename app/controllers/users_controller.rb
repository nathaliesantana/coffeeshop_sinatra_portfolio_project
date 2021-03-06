require 'rack-flash'
class UsersController < ApplicationController
  enable :sessions
  use Rack::Flash

  post '/signup' do
    if params[:username] == '' || params[:email] == '' || params[:password] == ''
      flash[:message] = "Please fill all the blank spaces."
      redirect'/signup'
    elsif User.all.any? { |e| e.email.include?(params[:email])}
      flash[:message] = "This email already exists, please log in."
      redirect'/login'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect'/custombeverages'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/custombeverages'
    else
      redirect '/signup'
    end
  end

  get '/signup' do
    if !logged_in?
      erb:'signup'
    else
      redirect '/custombeverages'
    end
  end

  get '/login' do
    if !logged_in?
      erb:'login'
    else
      redirect '/custombeverages'
    end
  end

  get '/logout' do

    if !!logged_in?
      session.destroy
      redirect'/'
    else
      redirect'/'
    end
  end

end
