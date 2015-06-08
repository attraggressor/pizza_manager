class CompanyBranchesController < ApplicationController
  before_action :find_company_branch, only: [:show, :edit, :update, :destroy]

  def index
    @company_branches = CompanyBranch.all
  end

  def new
    @company_branch = CompanyBranch.new
    @week_days = BusinessHour::WEEK_DAYS
  end

  def create
    @company_branch = CompanyBranch.new(company_branch_params)
    @week_days = BusinessHour::WEEK_DAYS

    if @company_branch.save
      
      hash_data = params['business_hours'] 
      
      BusinessHour.business_hours_keys.each do |day|            
        @business_hour = BusinessHour.new
        @business_hour.day = day.to_s
        @business_hour.company_branch_id = @company_branch.id
        @business_hour.open_time = Time.parse( hash_data["#{day}"]['open_time(4i)'].to_s + ':' + hash_data["#{day}"]['open_time(5i)'].to_s + ':00' )  
        @business_hour.close_time = Time.parse( hash_data["#{day}"]['close_time(4i)'].to_s + ':' + hash_data["#{day}"]['close_time(5i)'].to_s + ':00' )  
        @business_hour.save          
      end
      render :show
    else
      render :new
    end
  end

  def show
    @week_days = BusinessHour::WEEK_DAYS
  end

  def edit
    @week_days = BusinessHour::WEEK_DAYS
    @business_hours = @company_branch.business_hour
  end

  def update
    @business_hours = @company_branch.business_hour
    @week_days = BusinessHour::WEEK_DAYS
    
    if @company_branch.update_attributes(company_branch_params)
      
      hash_data = params['business_hours'] 
      
      BusinessHour.business_hours_keys.each do |day|    
        business_hour = BusinessHour.find_or_initialize_by(company_branch_id: @company_branch.id, day: day)
        business_hour.update_attributes(
          open_time: Time.parse( hash_data["#{day}"]['open_time(4i)'].to_s + ':' + hash_data["#{day}"]['open_time(5i)'].to_s + ':00' ),  
          close_time: Time.parse( hash_data["#{day}"]['close_time(4i)'].to_s + ':' + hash_data["#{day}"]['close_time(5i)'].to_s + ':00' )  
          )          
      end

      render :show
    else
      render :edit
    end
  end

  def destroy
    @company_branch.destroy
    redirect_to company_branches_path
  end

  private

    def find_company_branch
      @company_branch = CompanyBranch.find(params[:id])
    end

    def company_branch_params
      params.require(:company_branch).permit(:name, :address_line, :address_zip_code, :address_city, product_ids: [])
    end

end