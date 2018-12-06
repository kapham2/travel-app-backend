class Api::V1::DestinationsController < ApplicationController
    
    def show
        @destination = Destination.find(params[:id])

        render json: {
            destination: @destination,
            photo_url: @destination.photo_url,
            users_visited: @destination.users_visited_with_avatar,
            users_saved: @destination.users_saved_with_avatar
        }
    end

    def show_destinations_by_city
        @destination = Destination.find_by(city: params[:city].downcase.split("-").join(" ").titlecase)
        if @user
            render json: {
                destination: @destination,
                photo_url: @destination.photo_url,
                users_visited: @destination.users_visited_with_avatar,
                users_saved: @destination.users_saved_with_avatar
            }
        else
            render json: { error: 'Invalid path' }, status: :not_found
        end
    end
end
