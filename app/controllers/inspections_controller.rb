class InspectionsController < ApplicationController
  before_action :find_inspection, only: [:show, :edit, :update, :destroy]
  
    def show
    end

    def new
      @inspection = Inspection.new
      #implicit new render
    end

    def create
      @inspection = Inspection.create(inspection_params)
      if @inspection.valid?
        redirect_to @inspection
      else
        @errors = @inspection.errors.full_messages
        render :edit
      end
    end

    def edit
      #before-action gives instance
      #implicit edit render
    end

    def update
      if @inspection.update(inspection_params)
        redirect_to @inspection
      else
        @errors = @inspection.errors.full_messages
        render :edit
      end
    end

    def destroy
      @inspection.destroy
      redirect_to inspections_path
    end


  private
    ###private methods
    def inspection_params
      params.require(:inspection).permit(:model, :reg_num, :system_id, :account_id, :fill_condition, :basin_condition, :tower_condition, :inspection_date)
    end

    def find_inspection
      @inspection = Inspection.find(params[:id])
    end

end #end of inspection controller class
