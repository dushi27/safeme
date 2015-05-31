class SessionController < ApplicationController
    def get
    end
    
    def create 
        @user = User.where(:email => params[:email]).first
        if @user.nil? or @user.password !=  Digest::MD5.hexdigest(params[:password])
            redirect_to root_path, :notice => 'Invalid data'
        elsif session[:hex].nil? and @user.session.nil? and @user.password == Digest::MD5.hexdigest(params[:password])        
            @hex = SecureRandom.hex
            session[:hex] = @hex
            session[:uid] = @user.id
            @user.session = @hex
            @user.save
        end
    end
    
    def destroy
        unless session[:uid].nil? and session[:hex].nil? and @user.session.nil?  
            @user = User.find(session[:uid])
            session[:hex] = nil
            @user.session = nil
            @user.save            
        end
    end
end
