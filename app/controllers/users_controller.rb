class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit ]


  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
    # binding.pry
  end

  def index
    @users = User.all
    @book = Book.new
    @user=current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def follow
    @user=User.find(params[:id])
  end

  def follower
    @user=User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])

    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
