class CustomBeverages < ApplicationController

  get '/custombeverages' do
    if !!logged_in?
      @user = current_user
      erb :'custom_beverages'
    else
      redirect to '/login'
    end

  end

end
