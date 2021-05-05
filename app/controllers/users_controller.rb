class UsersController < ApplicationController

def index
 @users = User.all
 @user = current_user
 @book = Book.new
end


def show
  @books = Book.all
  @user = User.find(params[:id])
  @book = Book.new

end



def create
 @user = User.new(user_params)
 @user_id = current_user.id
 @user.save
 redirect_to users_path
end


def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])

  if @user.update(user_params)

   flash[:notice] = "You have updated user successfully."
	  redirect_to user_path

  else

  render :edit
  end
end




private
 def user_params
  params.require(:user).permit(:profile_image,:name,:introduction)
 end

end
