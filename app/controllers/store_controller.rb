class StoreController < ApplicationController
  
  skip_before_filter :authorize
  def index
     @products = Product.all
  end
  
  def create
if user = User.authenticate(params[:name], params[:password])
session[:user_id] = user.id
redirect_to admin_url
else
redirect_to login_url, :alert => "Invalid user/password combination"
end
end
end
