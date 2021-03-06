class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_valid_user, only: [:index]

  def index

    if current_user.name == nil
      @message = "Welcome"
    else
      @message = "Welcome " + current_user.name
    end

    @role = current_user.role


  end

  def check_if_valid_user
     if AllowedUser.where(email: current_user.email).blank?
       id = current_user.id
       sign_out current_user
       User.destroy(id)
       redirect_to new_user_session_path
     end

  end

end
