class SessionController < ApplicationController
 before_action :validations, only: [:create]
    def show
    end
    
    def create 
     @hex = SecureRandom.hex
     session[:hex] = @hex
     session[:uid] = @user.id
     @user.session = @hex
     @user.save           
    
     redirect_to edit_user_path(@user.id), :flash => {:notice => 'Welcome'}
    end
    
    def destroy
     unless session[:uid].nil? and session[:hex].nil? and @user.session.nil?  
       @user = User.find(session[:uid])
       session[:hex] = nil
       session[:uid] = nil
       @user.session = nil
       @user.save            
     end
       redirect_to root_path, notice: 'See you later'
    end
    
    private
    
    def validations
     @user = User.where(:email => params[:email]).first
     redirect_to root_path, :flash => {notice: 'Invalid user'} and return if @user.nil?
     redirect_to edit_user_path(@user.id), :flash => {notice: 'Your are already logged in'} and return if !session[:hex].nil?      
     redirect_to root_path, :flash => {notice: 'Incorrect password'} and return if @user.password !=  Digest::MD5.hexdigest(params[:password])
    end
end
