class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
@users = User.order(:name)
respond_to do |format|
format.html # index.html.erb
format.xml { render :xml => @users }
end
end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(user_params)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
	    format.html { redirect_to(users_url,:notice => "User #{@user.name} was successfully created." ) }
		format.json { render :show, status: :created, location: @user }	 
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(user_params)

    respond_to do |format|
      if @user.update_attributes(params[:user])
	    format.html { redirect_to(users_url,:notice => "User #{@user.name} was successfully updated." ) }
        format.xml { head :ok }
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
		format.xml { render :xml => @user.errors,:status => :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    begin
	@user.destroy
	flash[:notice] = "User #{@user.name} deleted"
	rescue Exception => e
	flash[:notice] = e.message
	end

    respond_to do |format|
      format.html { redirect_to users_url }
	  format.xml { head :ok }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :hashed_password, :salt)
    end
end
