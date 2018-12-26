class AccountsController < ApplicationController
before_action :find_account, only: [:show, :edit, :update, :destroy]
  def index
      if Account.where('name LIKE ?', "%#{params[:search]}%").length > 0
        @accounts  = Account.where('name LIKE ?', "%#{params[:search]}%")
      else
        @accounts = Account.all
      #implicit index render
      end
    end

    def new
      @account = Account.new
      #implicit new render
    end
    def show
    end
    def create
      @account = Account.create(account_params)
      if @account.valid?
        redirect_to @account
      else
        @errors = @account.errors.full_messages
        render :edit
      end
    end

    def edit
      #implicit edit render
    end

    def update
      if @account.update(account_params)
        redirect_to @account
      else
        @errors = @account.errors.full_messages
        render :edit
      end
    end

    def destroy
      @account.destroy
      redirect_to accounts_path
    end


  private
    ###private methods
    def account_params
      params.require(:account).permit(:name, :acct_num, :rep_id, :search)
    end

    def find_account
      @account = Account.find(params[:id])
    end
end
