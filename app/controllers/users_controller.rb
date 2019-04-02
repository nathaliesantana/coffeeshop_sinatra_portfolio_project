class UsersController < ApplicationController

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect'/custom_beverages' #a list of all users beverages.
  end

  get '/signup' do
    erb :'signup'
  end

end
