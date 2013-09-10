class UsersController < ApplicationController
  def show
  end
  
  def edit
    @user = current_user
  end
  
  def update
    #if (current_user.password_digest==Digest::MD5::hexdigest(params[:user][:old_password]))
    if current_user.authenticate(params[:user][:old_password])
      if current_user.update_attributes(user_params)
        flash.now[:success]="OK"
        render 'edit'
      else
        flash.now[:error]="NEM OK"
        render 'edit'
      end
    else
        flash.now[:error]="NAGYON NEM OK"
        render 'edit'
    end
    

  end
  
  private
  
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end