class MissionsController < ApplicationController

    def index
        render json: Mission.all, status: :ok
    end
    
    def create
        mission = Mission.create!(mission_params)
        render json: mission, status: :created
    end



    private

    def mission_params
        params.permit(:name, :planet_id, :scientist_id)
    end
end