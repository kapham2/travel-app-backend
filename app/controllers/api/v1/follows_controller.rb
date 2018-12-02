class Api::V1::FollowsController < ApplicationController
    
    def index
        render json: { follows: Follow.all }
    end

    def create
        @follow = Follow.create(follow_params)
        render json: { follow: @follow }
    end

    def destroy
        @follow = Follow.find(params[:id])
        Follow.find(params[:id]).destroy
        render json: @follow
    end

    private 
    
    def follow_params
        params.require(:follow).permit(:follower_id, :following_id)
    end
end
