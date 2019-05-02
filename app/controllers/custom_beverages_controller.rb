class CustomBeverages < ApplicationController

  post '/custombeverages' do
    redirect_if_not_logged_in
   if params[:content] == "" || params[:title] == ""
     redirect to '/custombeverages/new'
   else
     @beverages = current_user.custom_beverages.create(title: params[:title], content: params[:content])
     redirect to '/custombeverages'
   end
  end

  get '/custombeverages' do
    redirect_if_not_logged_in
    erb :'custom_beverages'
  end

  get '/custombeverages/new' do
    redirect_if_not_logged_in
    erb :'new_custom_beverage'
  end

  get "/custombeverages/:id" do
    redirect_if_not_logged_in
    @beverage = CustomBeverage.find_by_id(params[:id])
    erb :'show_custom_beverage'
  end

  get '/custombeverages/:id/edit' do
    redirect_if_not_logged_in
    @beverage = CustomBeverage.find_by_id(params[:id])
    if @beverage && @beverage.user == current_user
      erb :'edit_custom_beverage'
    else
      redirect to '/'
    end
  end

  patch '/custombeverages/:id' do
    redirect_if_not_logged_in
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
  end

  delete '/custombeverages/:id/delete' do
    redirect_if_not_logged_in
    @beverage = CustomBeverage.find_by_id(params[:id])
    if @beverage && @beverage.user == current_user
      @beverage.delete
    end
    redirect to '/custombeverages'
  end

end
