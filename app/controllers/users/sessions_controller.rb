class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:guest_sign_in]
  
  def guest_sign_in
    user = User.guest
    unless user.valid?
      flash[:alert] = user.errors.full_messages.join(", ")
      redirect_to root_path
      return
    end
    
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました。"
  end
end