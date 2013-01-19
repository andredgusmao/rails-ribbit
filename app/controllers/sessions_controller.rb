#encoding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user && user.authenticate(params[:password])
  		session[:userid] = user.id
      redirect_to :controller => 'users', :action => 'show', :id => user.id, notice: "Logado!"
    else 
      flash[:error] = "Usuário ou senha Incorretos"
  		redirect_to root_url
    end
  end

  def destroy
  	session[:userid] = nil
  	redirect_to root_url, notice: "Logoff!"
  end
end
