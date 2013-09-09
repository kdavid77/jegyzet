class SessionsController < ApplicationController
  def new
    user=User.find_by_name('dodi') 
    if (user.nil?)
      user=User.new(name: 'dodi',password: 'akarmi', password_confirmation: 'akarmi')
      user.save
    end
  end
  
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = 'Nem jo...'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end
