class TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :update, :destroy]
  before_action :authorized


  def index
    if Test.where('name LIKE ?', "%#{params[:search]}%").length > 0
      @tests  = Test.where('name LIKE ?', "%#{params[:search]}%")
    else
      @tests = Test.all
    #implicit index render
    end
  end

  def new
    @test = Test.new
    #implicit new render
  end
  def show
  end
  def create
    @test = Test.create(test_params)
    if @test.valid?
      redirect_to @test
    else
      @errors = @test.errors.full_messages
      render :edit
    end
  end

  def edit
    #implicit edit render
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      @errors = @test.errors.full_messages
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end


  private
  ###private methods
  def test_params
    params.require(:test).permit(:name, :reading, :comment, :report_id, :search)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
