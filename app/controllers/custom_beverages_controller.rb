class CustomBeverages < ApplicationController

  get '/custombeverages' do
    if !!logged_in?
      @user = current_user
      erb :'custom_beverages'
    else
      redirect to '/login'
    end
  end

  get '/custombeverages/new' do
    if !!logged_in?
      @user = current_user
      erb :'new_custom_beverage'
    else
      redirect to '/login'
    end
  end

end
