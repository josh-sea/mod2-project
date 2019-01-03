class RepsController < ApplicationController
  before_action :find_rep, only: [:show, :edit, :update, :destroy]
  # validates :username, uniqueness: true

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
        session[:rep_id] = @rep.id
        redirect_to @rep
      else
        @errors = @rep.errors.full_messages
        render :new
      end
    end

    def edit
      #implicit edit render
    end

    def update
      # @new_rep = params["rep"["id"]]
      # @new_rep.to_i
      # byebug
      if @rep.update(rep_params)
        redirect_to @rep
      else
        @errors = @rep.errors.full_messages
        render :edit
      end
    end

    def reassign
      new_rep_id = params[:id]
      reassign_rep(new_rep_id)
    end

    def destroy
      @rep.destroy
      redirect_to reps_path
      flash[:notice] = "You deleted your account."
    end

  private
    ###private methods
    def rep_params
      params.require(:rep).permit(:name, :region, :username, :password, :rep, :id, :search)
    end

    def find_rep
      @rep = Rep.find(params[:id])
    end


end ##end of reps controller class
