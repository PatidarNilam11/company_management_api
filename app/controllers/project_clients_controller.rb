class ProjectClientsController < ApplicationController
	before_action :find_projectclient, except: %i[create index]

	def index
		@project_clients =  ProjectClient.all
		render json: @project_clients, status: :ok
	end

	def show
		render json:  @pclient, status: :ok
	end

	def create
		@pclient =  ProjectClient.new( projectclient_params)
		if @pclient.save
			render json:  @pclient, status: :created
		else
			render json: { errors:  @pclient.errors.full_messages },
									status: :unprocessable_entity
		end
	end

	def update
		unless  @pclient.update( ProjectClient_params)
				render json: { errors:  @pclient.errors.full_messages },
												status: :unprocessable_entity
		end
		render json: { message: ' ProjectClient update successfully' }, status: :ok
	end

	def destroy
		@pclient.destroy
		render json: { message: ' ProjectClient delete successfully' }, status: :ok
	end

	private

	def find_projectclient
		@pclient =  ProjectClient.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render json: { errors: ' ProjectClient not found' }, status: :not_found
	end
    
	def  projectclient_params
		params.permit(
				:name, :email, :contact, :address
		)
	end
end
