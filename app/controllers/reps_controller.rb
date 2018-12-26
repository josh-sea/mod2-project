class RepsController < ApplicationController
before_action :find_rep, only: [:show, :edit, :update, :destroy]
  def index
      if Rep.where('name LIKE ?', "%#{params[:search]}%").length > 0
        @reps  = Rep.where('name LIKE ?', "%#{params[:search]}%")
      else
        @reps = Rep.all
      #implicit index render
      end
    end

    def show
    end

    def new
      @rep = Rep.new
      #implicit new render
    end

    def create
      @rep = Rep.create(rep_params)
      if @rep.valid?
        redirect_to @rep
      else
        @errors = @rep.errors.full_messages
        render :edit
      end
    end

    def edit
      #implicit edit render
    end

    def update
      if @rep.update(rep_params)
        redirect_to @rep
      else
        @errors = @rep.errors.full_messages
        render :edit
      end
    end

    def destroy
      @rep.destroy
      redirect_to reps_path
    end


  private
    ###private methods
    def rep_params
      params.require(:rep).permit(:name, :region, :search)
    end

    def find_rep
      @rep = Rep.find(params[:id])
    end


end ##end of reps controller class
