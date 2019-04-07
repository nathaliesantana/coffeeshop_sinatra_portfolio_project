class CustomBeverages < ApplicationController

  post '/custombeverages' do
    if !!logged_in?
      if params[:content] == "" || params[:title] == ""
        redirect to '/custombeverages/new'
      else
        @userbeverages = current_user.custombeverage.create(title: params[:title], content: params[:content])
        redirect to '/custombeverages'
      end
    else
      redirect to '/login'
    end
  end

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
