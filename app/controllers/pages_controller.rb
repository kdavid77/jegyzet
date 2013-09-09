class PagesController < ApplicationController
  def home
  end

  def login
    user=User.find_by_name('dodi') 
    if (user.nil?)
      user=User.new(name: 'dodi',password_digest: '1a6555336f456f57ce6aa65ac2948c83')
      user.save
    else
    end

  end
end
