class SessionsController < ApplicationController
      

    # def set_auth
    #   @auth = session[:omniauth] if session[:omniauth]
    #   puts "*" * 200
    #   puts request.env['omniauth.auth']
    #   puts "*" * 200

    # end
  def new
  end

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
  #     #OMNIAuth________
  #     # user = User.sign_in_from_omniauth(auth)
  #     # # log_in(user)
  #     # redirect_to root_url, notice: "You Have Successfully Signed In!"
  #     # puts"*"*200
  #
  #     # puts auth_hash.extra.to_hash["raw_info"]["email"]
  #     # puts"*"*200
  #     # @user = User.find_or_create_from_auth_hash(auth_hash)
  #     # auth_hash
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
      # redirect_to root_path
      render 'whatever'
    end
  #
  def destroy
    log_out if logged_in?
    #  redirect_to root_url
  #
  session[:user_id] = nil
  session[:omniauth] = nil
  redirect_to root_url, notice: "You Have Signed Out."
   end
  #
  # protected
  #
  def auth_hash
    request.env['omniauth.auth']
  end

end
