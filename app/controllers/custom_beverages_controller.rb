class CustomBeverages < ApplicationController

  post '/custombeverages' do
    if !!logged_in?
      if params[:content] == "" || params[:title] == ""
        redirect to '/custombeverages/new'
      else
        @beverages = current_user.custom_beverages.create(title: params[:title], content: params[:content])
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

  get "/custombeverages/:id" do
   if !!logged_in?
     @beverage = CustomBeverage.find_by_id(params[:id])
     erb :'show_custom_beverage'
   else
     redirect to '/login'
   end
  end

  get '/custombeverages/:id/edit' do
    if !!logged_in?
      @beverage = CustomBeverage.find_by_id(params[:id])
      if @beverage && @beverage.user == current_user
        erb :'edit_custom_beverage'
      else
        redirect to '/'
      end
    else
      redirect to '/login'
    end
  end

  patch '/custombeverages/:id' do
    if !!logged_in?
      if params[:content] == "" || params[:title] == ""
        redirect to '/custombeverages/#{params[:id]}/edit'#Double check this
      else
        @beverage = CustomBeverage.find_by_id(params[:id])
        if @beverage && @beverage.user == current_user
          @beverage.update(content: params[:content], title: params[:title])
          redirect to '/custombeverages'
        else
          redirect to '/'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/custombeverages/:id/delete' do
    if !!logged_in?
      @beverage = CustomBeverage.find_by_id(params[:id])
      if @beverage && @beverage.user == current_user
        @beverage.delete
      end
      redirect to '/custombeverages'
    else
      redirect to '/login'
    end
  end

end
