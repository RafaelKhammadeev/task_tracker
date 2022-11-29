class UsersController < ApplicationController
  before_action -> { authorize! User }

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "You've successfully signed up!"
    else
      render :new
    end
  end

  private

  def update_user
    @update_user ||= Users::Update.call(user_params: user_params, user: current_user)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
