class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		file = params[:session][:checksum]
		if file
			cs   = Digest::SHA512.hexdigest( File.read(file.path))
		end
		if user && user.authenticate(params[:session][:password]) && user.valid_checksum(cs)
			flash.[:success] = "Successful authentication!"
			#signin user
			redirect_to user
		# Sign the user in and redirect to the user's show page.
		else
			flash.now[:error] = 'Invalid email/password/file combination' # Not quite right!
      		render 'new'
		end
	end

	def destroy
		
	end



end
