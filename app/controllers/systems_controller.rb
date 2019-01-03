class SystemsController < ApplicationController
  before_action :find_system, only: [:show, :edit, :update, :destroy]
  before_action :authorized
    def show
    end

    def new
      @system = System.new
      #implicit new render
    end

    def create
      @system = System.create(system_params)
      if @system.valid?
        redirect_to @system
      else
        @errors = @system.errors.full_messages
        render :edit
      end
    end

    def edit
      #before-action gives instance
      #implicit edit render
    end

    def update
      if @system.update(system_params)
        redirect_to @system
      else
        @errors = @system.errors.full_messages
        render :edit
      end
    end

    def destroy
      @system.destroy
      redirect_to systems_path
    end


  private
    ###private methods
    def system_params
      params.require(:system).permit(:system_type, :treatment_comment, :seasonal, :account_id)
    end

    def find_system
      @system = System.find(params[:id])
    end

end
