class Api::V1::UserDestinationsController < ApplicationController
    
    def index
        render json: { user_destinations: UserDestination.all }
    end

    def create
        @user_destination = UserDestination.create(user_destination_params)
        render json: @user_destination
    end

    def update
        @user_destination = UserDestination.find(params[:id]).update(user_destination_params)
        render json: @user_destination
    end

    def destroy
        @user_destination = UserDestination.find(params[:id])
        UserDestination.find(params[:id]).destroy
        render json: @user_destination
    end

    private 
    
    def user_destination_params
        params.require(:user_destination).permit(:user_id, :destination_id, :visited)
    end
end
