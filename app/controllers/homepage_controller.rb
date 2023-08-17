class HomepageController < ApplicationController

  def index
    if current_user
        redirect_to '/'
    else
        return
    end
  end
end
