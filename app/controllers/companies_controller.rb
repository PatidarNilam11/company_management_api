class CompaniesController < ApplicationController
    # before_action :find_company, except: %i[create index]

    def index
      @companys = Company.all
      render json: @companys, status: :ok
    end
  
    def show
        @company = Company.find(params[:id])
      render json: @company, status: :ok
    end
  
    def create
      @company = Company.new(company_params)
      if @company.save
        render json: @company, status: :created
      else
        render json: { errors: @company.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
 
    def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
        render json: @company
        else
          render json: @company.errors.full_messages
      end
    end
    
      def destroy
        @company = Company.find(params[:id])
        @company.destroy
        render json: "deleted......."
       end

    private
  
    def company_params
      params.permit(:name,:description, :subdomain, :user_id)
    end 
end
