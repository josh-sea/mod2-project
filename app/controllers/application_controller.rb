class ApplicationController < ActionController::Base
  helper_method :current_rep
  before_action:authorized


  def current_rep
      # Rep.find would throw an error if we cannot find the rep
      Rep.find_by({id: session[:rep_id]})
    end

    def logged_in?
      # nil is falsey in ruby
      # a rep instance is truthy
      !!current_rep
    end

    def authorized
      redirect_to login_path unless logged_in?
    end

end #end of ApplicationController class
