class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params) #set to invalid User to force errors if upload is invalid
		@file = params[:user][:checksum]
		if @file
			#compute the SHA512 hash of a the uploaded file
			#if file is blank -> give user a token file
			#file_cs = Digest::SHA512.hexdigest( File.read(@file.path))
			@user.checksum = Digest::SHA512.hexdigest( File.read(@file.path))
			
			#output to server the checksum of 
			p "*********************** #{@user.checksum} ***************************"
		end
		if @user.save
			flash[:success] = "Welcome to fAuth"
			redirect_to @user
		else
			render 'new'
		end

	end

	def index
	end

	def show
		@user = User.find(params[:id])
	end


private
	def user_params
  		params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
    end

    

end
