class CustomBeverages < ApplicationController

  get '/custombeverages' do
    erb :"custom_beverages"
  end

end
