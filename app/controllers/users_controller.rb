class UsersController < ApplicationController
	def new 
		@user = User.new
	end
	def create 
		@user = User.new(params[:user])
		puts @user
		if(@user.save)
			redirect_to @user, notice: "Obrigado por se Cadastrar no Ribbit!"
		else 
			render 'new'
		end
	end
	def show
	  @user = User.find(params[:id])
	end
end
