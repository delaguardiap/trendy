class SessionsController < ApplicationController


    # end
  def new
  end

# Creates Session when a user creates and account or logsin
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		redirect_to root_path
  		else
  			flash.now[:danger] = "Invalid email/password combination"
  			render 'new'
  		end
    end

    def omnicreate
      @user = User.find_by(uid: auth_hash.uid)
      unless @user
        @user = User.new
        @user.uid = auth_hash.uid
        @user.email = auth_hash.extra.to_hash["raw_info"]["email"]
        @user.name = auth_hash.extra.to_hash["raw_info"]["name"]
        @user.save!(validate: false)
      end
      current_user = @user
      session[:user_id] = @user.id
      redirect_to root_path

    end

  def destroy
    log_out if logged_in?
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_url, notice: "You Have Signed Out."
   end

  def auth_hash
    request.env['omniauth.auth']
  end

end
