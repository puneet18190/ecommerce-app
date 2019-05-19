class RegistrationsController < Devise::RegistrationsController

  def show
  	if current_user.id == params[:id]
	  @user = User.find params[:id]
	else
      redirect_to root_url, alert: "Unauthorized"
	end
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone_number, :country_code)
  end
end
