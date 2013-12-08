class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by( email: ['email = ?',params[:session][:email].downcase])
		file = params[:session][:checksum]
		if file
			cs   = Digest::SHA512.hexdigest( File.read(file.path))
		end
		if user && user.authenticate(params[:session][:password]) && user.valid_checksum(cs)
			flash[:success] = "Successful authentication!" 

			#after successful login display the contents of param to show users
			s = ""
			params[:session].each{ |param|
				s += "#{param} \n"
			}
			flash[:warning] = "#{s}".html_safe
			
			#signin user
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password/file combination' # Not quite right!
      		render 'new'
		end
	end

	def destroy
		
	end



end
