class SystemsController < ApplicationController

  def index
      if System.where('name LIKE ?', "%#{params[:search]}%").length > 0
        @systems  = System.where('name LIKE ?', "%#{params[:search]}%")
      else
        @systems = System.all
      #implicit index render
      end
    end

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
      params.require(:system).permit(:name, :region, :search)
    end

    def find_system
      @system = System.find(params[:id])
    end

end
