class SessionsController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
            &.authenticate(user_params[:password])

    if @user
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "You've successfully logged in!"
    else
      @user = User.new
      @user.errors.add :base, "Wrong email or password"
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    @current_user = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
