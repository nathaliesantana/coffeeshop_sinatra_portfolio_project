class CustomBeverages < ApplicationController

  get '/custombeverages' do
    if !!logged_in?
      erb :'custom_beverages'
    else
      redirect to '/login'
    end

  end

end
