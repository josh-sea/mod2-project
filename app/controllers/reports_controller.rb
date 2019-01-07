class ReportsController < ApplicationController
  before_action :find_report, only: [:show, :edit, :update]

    def show
    end

    def new
      if params[:system]
        @account = Account.find(params[:system][:account_id])
        @report = Report.new(rep_id: current_rep.id)
        render :new
      else
        @report = Report.new(rep_id: current_rep.id)
        render :new
      end
    end

    def create
      @report = Report.create(report_params)
      if @report.valid?
        @test = Test.all.find(1)
        @test2 = Test.all.find(2)
        render :new_report
      else
        @errors = @report.errors.full_messages
        render :new
      end
    end

    def edit
      #before-action gives instance
      #implicit edit render
    end

    def update
      if @report.update(report_params)
        redirect_to @report
      else
        @errors = @report.errors.full_messages
        render :edit
      end
    end

    #No destroy, this could delete the rep and accounts as dependencies maybe?
    # def destroy
    #   @report.destroy
    #   redirect_to reports_path
    # end

  private
    ###private methods
    def report_params
      params.require(:report).permit(:rep_id, :system_id)
    end

    def find_report
      @report = Report.find(params[:id])
    end


end #end of reports controller class
