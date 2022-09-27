class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Scientist.all, status: :ok
    end

    def show
        render json: Scientist.find(params[:id]), serializer: ScientistMissionSerializer,
        status: :ok

    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :ok
    end

    def destroy
        Scientist.find(params[:id]).destroy
        render json: {}
        head :no_content
    end


    private
    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end
    
    def invalid(error)
        render json:  { errors: error.message  }, status: :unprocessable_entity
    end

    def not_found
       render json: { error: "Scientist not found" }, status: :not_found
    end
end
