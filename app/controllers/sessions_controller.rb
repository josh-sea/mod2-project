class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :signup, :create]
  layout false, only: [:new]

  def new
    #implicit sessions new render
  end


  def create
    # find out if we have a user with this username
    @rep = Rep.find_by(username: params[:username])
    if @rep && @rep.authenticate(params[:password])
      session[:rep_id] = @rep.id
      redirect_to accounts_path
    else
      flash[:notice] = 'Invalid username or password'
      redirect_to login_path
    end
  end


  def destroy
    session.delete(:rep_id)
    flash[:notice] = "You are no longer logged in"
    redirect_to login_path
  end

end #end of sessions controller
